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

    @GetMapping("/all/{id}")
    public ResponseEntity<FileClass> getById(@PathVariable int id) {
        Optional<FileClass> fileclass = fileClassService.findById(id);
        return ResponseEntity.ok(fileclass.orElse(null));
    }

    @PostMapping("/upload")
    public ResponseEntity<String> uploadFile(@RequestParam("file") MultipartFile file) {
        try {
            String fileUrl = supabaseStorageService.uploadFile(file);
            return ResponseEntity.ok("File uploaded successfully. URL: " + fileUrl);
        } catch (Exception e) {
            return ResponseEntity.status(500).body("File upload failed: " + e.getMessage());
        }
    }

    @PutMapping("/update")
    public ResponseEntity<String> updateFile(@RequestParam("file") MultipartFile file, @RequestParam String url) {
        try {
            ResponseEntity<String> respone = supabaseStorageService.updateFile(url,file);
            return ResponseEntity.ok("File updated successfully. URL: " + url);
        } catch (Exception e) {
            return ResponseEntity.status(500).body("File upload failed: " + e.getMessage());
        }
    }

    @DeleteMapping("/delete")
    public void deleteFile(@RequestBody FileClass fileclass) {
        fileClassService.delete(fileclass);
    }
}
