package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.FileClass;
import com.example.A_Learning_Springboot.repositories.FileClassRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FileClassService {
    @Autowired
    private FileClassRepository fileClassRepository;

    public FileClass save(FileClass fileClass) {
        return fileClassRepository.save(fileClass);
    }

    public List<FileClass> findAll() {
        return fileClassRepository.findAll();
    }

    public Optional<FileClass> findById(int id) {
        return fileClassRepository.findById(id).isPresent() ? Optional.of(fileClassRepository.findById(id).get()) : Optional.empty();
    }

    public void delete(FileClass fileclass) {
        fileClassRepository.delete(fileclass);
    }

    public void deleteById(int id) {
        fileClassRepository.deleteById(id);
    }
}
