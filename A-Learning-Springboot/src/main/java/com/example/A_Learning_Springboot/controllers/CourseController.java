package com.example.A_Learning_Springboot.controllers;

import com.example.A_Learning_Springboot.entities.Course;
import com.example.A_Learning_Springboot.entities.Level;
import com.example.A_Learning_Springboot.entities.User;
import com.example.A_Learning_Springboot.services.CourseService;
import com.example.A_Learning_Springboot.services.UserService;
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
    @Autowired
    private final UserService userService;
    public CourseController(CourseService courseService, UserService userService) {
        this.courseService = courseService;
        this.userService = userService;
    }
    @GetMapping("/user/{userId}")
    public ResponseEntity<List<Course>> getCoursesByUserId(@PathVariable int userId) {
        Optional<User> user = userService.getUserById(userId);

        if (user.isPresent()) {
            List<Course> courses = user.get().getCoursesTeaching();
            return ResponseEntity.ok(courses);
        } else {
            return ResponseEntity.notFound().build();  // If user not found, return 404
        }
    }
    //read:
    @GetMapping("/all")
    public List<Course> getAllCourses(){
        return courseService.getAllCourses();
    }
@GetMapping("/student_courses/{level}")
public List<Course> getStudentCoursesLevel(@PathVariable Level level){
    System.out.println("Level received: " + level);
        return courseService.getCoursesByLevel(level);
}
    //read by id:
    @GetMapping("/all/{id}")
    public ResponseEntity<Course> getCourseById(@PathVariable String id){
        Optional<Course> course = courseService.getCourseById(id);
        return ResponseEntity.ok(course.orElse(null));
    }

    //create
    @PostMapping("/add")
    public Course addCourse(@RequestBody Course course){
        return courseService.saveCourse(course);
    }

    //update
    @PutMapping("/update")
    public ResponseEntity<Course> updateCourse(@RequestBody Course course){
        Course newCourse = courseService.saveCourse(course);
        return new ResponseEntity<>(newCourse, HttpStatus.OK);
    }

    //update by id
    @PutMapping("/update/{id}")
    public ResponseEntity<Course> updateCourseById(@PathVariable int id, @RequestBody Course course){
        Course newCourse = courseService.saveCourse(course);
        return new ResponseEntity<>(newCourse, HttpStatus.OK);
    }

    //delete
    @DeleteMapping("/delete")
    public ResponseEntity<Void> deleteCourse(@RequestBody Course course) {
        courseService.deleteCourse(course);
        return ResponseEntity.noContent().build();
    }

    //delete by id
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deleteCourseById(@PathVariable String id){
        courseService.deleteCourseById(id);
        return ResponseEntity.noContent().build();
    }
}
