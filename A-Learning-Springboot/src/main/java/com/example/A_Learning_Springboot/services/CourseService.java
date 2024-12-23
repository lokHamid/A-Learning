package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.Course;
import com.example.A_Learning_Springboot.repositories.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CourseService {
    private final CourseRepository courseRepository;

    public CourseService(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
    }

    public void deleteCourse(Course course){
        courseRepository.delete(course);
    }

    public Course saveCourse(Course course) {
        courseRepository.save(course);
        return course;
    }

    public Optional<Course> getCourseById(int id) {
        return courseRepository.findById(id);
    }

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

}
