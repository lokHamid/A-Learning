package com.example.A_Learning_Springboot.controllers;

import com.example.A_Learning_Springboot.entities.Course;
import com.example.A_Learning_Springboot.services.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/course")
public class CourseController {

    @Autowired
    private final CourseService courseService;

    public CourseController(CourseService courseService) {
        this.courseService = courseService;
    }

    //read:
    @GetMapping("/all")
    public List<Course> getAllCourses(){
        return courseService.getAllCourses();
    }

    //read by id:
    @GetMapping("/all/{id}")
    public ResponseEntity<Course> getCourseById(@PathVariable int id){
        Optional<Course> course = courseService.getCourseById(id);
        return ResponseEntity.ok(course.orElse(null));
    }

    //update
    @PutMapping("/update")
    public ResponseEntity<Course> updateCourse(@RequestBody Course course){
        Course newCourse = courseService.saveCourse(course);
        return new ResponseEntity<>(newCourse, HttpStatus.OK);
    }

    //create
    @PostMapping("/add")
    public Course addCourse(@RequestBody Course course){
        return courseService.saveCourse(course);
    }

    //delete
    @DeleteMapping("/delete")
    public ResponseEntity<Void> deleteCourse(@RequestBody Course course) {
        courseService.deleteCourse(course);
        return ResponseEntity.noContent().build();
    }

    //delete by id
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deleteCourseById(@PathVariable int id){
        courseService.deleteCourseById(id);
        return ResponseEntity.noContent().build();
    }
}
