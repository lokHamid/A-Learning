package com.example.A_Learning_Springboot.repositories;

import com.example.A_Learning_Springboot.entities.Course;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class CourseRepository {

    private List<Course> courses = new ArrayList<>();

    public CourseRepository() {
    }

    public void addCourse(Course course) {
        courses.add(course);
    }

    public void deleteCourse(String id) {
        courses.removeIf(course -> course.getId().equals(id));
    }

    public void updateCourse(Course updatedCourse) {
        for (int i = 0; i < courses.size(); i++) {
            if (courses.get(i).getId().equals(updatedCourse.getId())) {
                courses.set(i, updatedCourse);
                return;
            }
        }
    }

    public Optional<Course> getCourse(String id) {
        return courses.stream().filter(course -> course.getId().equals(id)).findFirst();
    }

    public List<Course> getAllCourses() {
        return new ArrayList<>(courses);
    }

}


