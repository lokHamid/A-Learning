package com.example.A_Learning_Springboot.repositories;

import com.example.A_Learning_Springboot.entities.Pw;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface PwRepository extends JpaRepository<Pw, Integer> {

    List<Pw> findByCourse_id(String course_id);
}
