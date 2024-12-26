package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.Course;
import com.example.A_Learning_Springboot.entities.Level;
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

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    public Optional<Course> getCourseById(String id) {
        return courseRepository.findById(id);
    }

    public Course saveCourse(Course course) {
        courseRepository.save(course);
        return course;
    }


    public void deleteCourse(Course course){
        courseRepository.delete(course);
    }

    public void deleteCourseById(String id) {
        courseRepository.deleteById(id);
    }
public List<Course> getCoursesByLevel(Level level) {
      return  courseRepository.findByLevel(level);
}
}

