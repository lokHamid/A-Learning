package com.example.A_Learning_Springboot.controllers;

import com.example.A_Learning_Springboot.entities.FileClass;
import com.example.A_Learning_Springboot.services.FileClassService;
import com.example.A_Learning_Springboot.services.SupabaseStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/files")
public class FileClassController {

    @Autowired
    private final FileClassService fileClassService;
    @Autowired
    private final SupabaseStorageService supabaseStorageService;


    public FileClassController(FileClassService fileClassService, SupabaseStorageService supabaseStorageService) {
        this.fileClassService = fileClassService;
        this.supabaseStorageService = supabaseStorageService;
    }

    @GetMapping("/all")
    public List<FileClass> getAll() {
        return fileClassService.findAll();
    }



    @GetMapping("/retrieveFile")
    public MultipartFile retrieveFile(@RequestBody FileClass fileClass) throws IOException {
        String url = fileClass.getUrl_file();
        return supabaseStorageService.getFile(url);
    }

    @PostMapping("/upload")
    public ResponseEntity<String> uploadFile(@RequestParam("file") MultipartFile file) {
        try {
            String fileUrl = supabaseStorageService.uploadFile(file);
            return ResponseEntity.ok(fileUrl);
        } catch (Exception e) {
            return ResponseEntity.status(500).body("File upload failed: " + e.getMessage());
        }
    }

    @GetMapping("/files/{idSolution}")
    public List<FileClass> getFilesBySolutionId(@PathVariable Integer idSolution ) {
        return fileClassService.findBySolutionId(idSolution);
    }

    @PutMapping("/update")
    public ResponseEntity<String> updateFile(@RequestParam("file") MultipartFile file, @RequestParam String url) {
        try {
            ResponseEntity<String> response = supabaseStorageService.updateFile(url,file);
            return ResponseEntity.ok("File updated successfully. URL: " + url);
        } catch (Exception e) {
            return ResponseEntity.status(500).body("File upload failed: " + e.getMessage());
        }
    }

    @DeleteMapping("/delete")
    public void deleteFile(@RequestBody FileClass fileclass) {
        fileClassService.delete(fileclass);
    }

    @DeleteMapping("/delete/{id}")
    public void deleteFileById(@PathVariable int id) {
        fileClassService.deleteById(id);
    }
}
