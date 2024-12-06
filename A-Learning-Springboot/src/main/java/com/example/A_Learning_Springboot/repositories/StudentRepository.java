package com.example.A_Learning_Springboot.repositories;

import com.example.A_Learning_Springboot.entities.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepository extends JpaRepository<Student,Integer> {
}
