package com.example.A_Learning_Springboot.repositories;

import com.example.A_Learning_Springboot.entities.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TeacherRepository extends JpaRepository<Teacher,Integer> {
}
