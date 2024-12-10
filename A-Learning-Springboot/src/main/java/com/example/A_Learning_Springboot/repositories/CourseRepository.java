package com.example.A_Learning_Springboot.repositories;

import com.example.A_Learning_Springboot.entities.Course;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseRepository extends JpaRepository<Course, Integer> {
}
