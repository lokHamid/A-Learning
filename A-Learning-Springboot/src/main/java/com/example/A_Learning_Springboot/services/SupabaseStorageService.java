package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.CustomMultipartFile;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Objects;

@Service
public class SupabaseStorageService {
    @Value("${supabase.url}")
    private String supabaseUrl;

    @Value("${supabase.key}")
    private String supabaseKey;

    @Value("${supabase.bucket}")
    private String supabaseBucket;
    public String uploadFile(MultipartFile multipartFile) throws IOException {

        File tempFile = File.createTempFile("upload", multipartFile.getOriginalFilename());
        multipartFile.transferTo(tempFile);

        String apiEndpoint = supabaseUrl + "/storage/v1/object/" + supabaseBucket + "/" + multipartFile.getOriginalFilename();

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + supabaseKey);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

        byte[] fileBytes = Files.readAllBytes(tempFile.toPath());
        HttpEntity<byte[]> entity = new HttpEntity<>(fileBytes, headers);

        ResponseEntity<String> response = restTemplate.exchange(
                apiEndpoint,
                HttpMethod.PUT,
                entity,
                String.class
        );

        if (response.getStatusCode() == HttpStatus.OK || response.getStatusCode() == HttpStatus.CREATED) {
            return supabaseUrl + "/storage/v1/object/public/" + supabaseBucket + "/" + multipartFile.getOriginalFilename();
        } else {
            throw new IOException("Failed to upload file to Supabase. Status: " + response.getStatusCode());
        }
    }

    public ResponseEntity<String> updateFile(String fileUrl, MultipartFile newFileContent) throws IOException {
        String filePath = fileUrl.replace(supabaseUrl + "/storage/v1/object/", "");

        String apiEndpoint = supabaseUrl + "/storage/v1/object/" + filePath;

        File tempFile = File.createTempFile("upload", newFileContent.getOriginalFilename());
        newFileContent.transferTo(tempFile);

        byte[] fileBytes = Files.readAllBytes(tempFile.toPath());

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + supabaseKey);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

        HttpEntity<byte[]> entity = new HttpEntity<>(fileBytes, headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(
                apiEndpoint,
                HttpMethod.PUT,
                entity,
                String.class
        );

        // Check response
        if (response.getStatusCode() == HttpStatus.OK || response.getStatusCode() == HttpStatus.CREATED) {
            return response;
        } else {
            throw new IOException("Failed to update file. Status: " + response.getStatusCode());
        }
    }

    private String extractFilePath(String fileUrl) {
        String prefix = supabaseUrl + "/storage/v1/object/public/" + supabaseBucket + "/";
        if (fileUrl.startsWith(prefix)) {
            return fileUrl.substring(prefix.length());
        } else {
            throw new IllegalArgumentException("Invalid file URL");
        }
    }

    public ResponseEntity<String> deleteFile(String url) throws IOException{
        String filePath = extractFilePath(url);

        String apiEndpoint = supabaseUrl + "/storage/v1/object/" + supabaseBucket + "/" + filePath;

        // Create headers
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + supabaseKey);

        // Create HTTP entity
        HttpEntity<String> entity = new HttpEntity<>(headers);

        // Make the DELETE request
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(
                apiEndpoint,
                HttpMethod.DELETE,
                entity,
                String.class
        );

        return response;
    }
    public String extractFileName(String filePathOrUrl) {
        if (filePathOrUrl == null || filePathOrUrl.isEmpty()) {
            throw new IllegalArgumentException("The file path or URL cannot be null or empty");
        }
        return filePathOrUrl.substring(filePathOrUrl.lastIndexOf('/') + 1);
    }

    public MultipartFile getFile(String url) throws IOException {
        String filePath = extractFilePath(url);
        String apiEndpoint = supabaseUrl + "/storage/v1/object/" + filePath;

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + supabaseKey);
        HttpEntity<Void> entity = new HttpEntity<>(headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<byte[]> response = restTemplate.exchange(
                apiEndpoint,
                HttpMethod.GET,
                entity,
                byte[].class
        );

        if(response.getStatusCode() == HttpStatus.OK){
            byte[] fileBytes = response.getBody();
            String fileName = extractFileName(url);
            String contentType = Objects.requireNonNull(response.getHeaders().getContentType()).toString();

            return new CustomMultipartFile(fileBytes,fileName,contentType);
        } else {
            throw new IOException("Failed to retrieve file , status:" + response.getStatusCode());
        }
    }
}
