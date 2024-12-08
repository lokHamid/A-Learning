package com.example.A_Learning_Springboot.controllers;

import com.example.A_Learning_Springboot.entities.Teacher;
import com.example.A_Learning_Springboot.services.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/teacher")
public class TeacherController {

    @Autowired
    private final TeacherService teacherService;
    public TeacherController(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    //read all:
    @GetMapping("/all")
    public List<Teacher> getAllTeachers(){
        return teacherService.getAllTeachers();
    }

    //read by id:
    @GetMapping("/all/{id}")
    public ResponseEntity<Teacher> getTeacherById(@PathVariable int id){
        Optional<Teacher> teacher = teacherService.getTeacherById(id);
        return teacher.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    //create:
    @PostMapping("/add")
    public Teacher addTeacher(@RequestBody Teacher teacher){
        return teacherService.saveTeacher(teacher);
    }

    //update:
    @PutMapping("/update")
    public ResponseEntity<Teacher> updateTeacher(@RequestBody Teacher teacher){
        Teacher newTeacher = teacherService.saveTeacher(teacher);
        return new ResponseEntity<>(newTeacher, org.springframework.http.HttpStatus.OK);
    }

    //delete:
    @DeleteMapping("/delete")
    public ResponseEntity<Void> deleteTeacher(@RequestBody Teacher teacher){
        teacherService.deleteTeacher(teacher);
        return ResponseEntity.noContent().build();
    }
}
