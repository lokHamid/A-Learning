package com.example.A_Learning_Springboot.repositories;

import com.example.A_Learning_Springboot.entities.Course;
import com.example.A_Learning_Springboot.entities.Level;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CourseRepository extends JpaRepository<Course, Integer> {
    List<Course> findByLevel(Level level);
}
