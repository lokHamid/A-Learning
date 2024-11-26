package com.example.A_Learning_Springboot.controllers;

import com.example.A_Learning_Springboot.entities.Course;
import com.example.A_Learning_Springboot.repositories.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/courses")
public class StudentDashboardController {

    @Autowired
    private CourseRepository courseRepository;

    StudentDashboardController(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
    }

    @GetMapping("/{id}")
    public ResponseEntity<Course> getCourse(@PathVariable String id) {
        Optional<Course> course = courseRepository.getCourse(id);
        return course.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<List<Course>> getAllCourses() {
        List<Course> courses = courseRepository.getAllCourses();
        return ResponseEntity.ok(courses);
    }
}