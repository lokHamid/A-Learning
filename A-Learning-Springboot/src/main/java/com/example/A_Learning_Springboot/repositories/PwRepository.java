package com.example.A_Learning_Springboot.repositories;

import com.example.A_Learning_Springboot.entities.Pw;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PwRepository extends JpaRepository<Pw, Integer> {

    Optional<Pw> findByCourse_IdCourse(String courseId);
}
