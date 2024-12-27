package com.example.A_Learning_Springboot.repositories;

import com.example.A_Learning_Springboot.entities.FileClass;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FileClassRepository extends JpaRepository<FileClass, Integer> {
    List<FileClass> findByIdPw(int idPw);
    @Query("SELECT f FROM FileClass f WHERE f.ref_solution.id_solution = :solutionId")
    List<FileClass> findBySolutionId(@Param("solutionId") int solutionId);
}
