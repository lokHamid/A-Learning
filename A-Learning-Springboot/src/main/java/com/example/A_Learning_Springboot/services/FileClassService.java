package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.FileClass;
import com.example.A_Learning_Springboot.repositories.FileClassRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class FileClassService {

    @Autowired
    private FileClassRepository fileClassRepository;

    public void save(FileClass fileClass) {
        fileClassRepository.save(fileClass);
    }

    public List<FileClass> findAll() {
        return fileClassRepository.findAll();
    }

    public List<FileClass> findByPwId(int pwId) {
        return fileClassRepository.findByIdPw(pwId);
    }
 public List<FileClass> findBySolutionId(Integer id) {
return fileClassRepository.findByIdSolution(id);
 }
    public void delete(FileClass fileClass) {
        fileClassRepository.delete(fileClass);
    }

    public void deleteById(int id) {
        fileClassRepository.deleteById(id);
    }
}
