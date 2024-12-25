package com.example.A_Learning_Springboot.repositories;

import com.example.A_Learning_Springboot.entities.FileClass;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FileClassRepository extends JpaRepository<FileClass, Integer> {
    List<FileClass> findByIdPw(int idPw);
}
