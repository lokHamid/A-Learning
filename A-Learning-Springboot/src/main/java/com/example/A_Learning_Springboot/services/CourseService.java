package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.Course;
import com.example.A_Learning_Springboot.repositories.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CourseService {
    private final CourseRepository courseRepository;

    public CourseService(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
    }

    public void deleteCourse(Course course){
        courseRepository.delete(course);
    }

    //implement other stuff here ... (i havent implemented everything)
}
