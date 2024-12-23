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

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    public Optional<Course> getCourseById(int id) {
        return courseRepository.findById(id);
    }

    public Course saveCourse(Course course) {
        courseRepository.save(course);
        return course;
    }

    public Course saveCourseById(int id, Course course) {
        Optional<Course> courseOptional = courseRepository.findById(id);
        if (courseOptional.isPresent()) {
            Course newCourse = courseOptional.get();
            newCourse.setCourseName(course.getCourseName());
            newCourse.setCourseName(course.getCourseName());
            newCourse.setCoefficient(course.getCoefficient());
            newCourse.setLevel(course.getLevel());
            courseRepository.save(newCourse);
        }
        return null;
    }
    public void deleteCourse(Course course){
        courseRepository.delete(course);
    }

    public void deleteCourseById(int id) {
        courseRepository.deleteById(id);
    }

}
