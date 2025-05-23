package com.example.A_Learning_Springboot.controllers;

import com.example.A_Learning_Springboot.entities.Student;
import com.example.A_Learning_Springboot.services.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/student")
public class StudentController{
    @Autowired
    private final StudentService studentService;

    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    //read:
    @GetMapping("/all")
    public List<Student> getAllStudents(){
        return studentService.getallstudents();
    }

    //read by id:
    @GetMapping("/all/{id}")
    public ResponseEntity<Student> getStudentById(@PathVariable int id){
        Optional<Student> student = studentService.getstudentbyid(id);
        return student.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    //create
    @PostMapping("/add")
    public Student addStudent(@RequestBody Student student){
        return studentService.saveStudent(student);
    }

    //update
    @PutMapping("/update")
    public ResponseEntity<Student> updateStudent( @RequestBody Student student){
        Student newStud = studentService.saveStudent(student);
        return new ResponseEntity<>(newStud, org.springframework.http.HttpStatus.OK);
    }

    //update by id
    @PutMapping("/update/{id}")
    public ResponseEntity<Student> updateStudentById(@PathVariable int id, @RequestBody Student student){
        Student newStud = studentService.saveStudentById(id, student);
        return new ResponseEntity<>(newStud, org.springframework.http.HttpStatus.OK);
    }

    //delete
    @DeleteMapping("/delete")
    public ResponseEntity<Void> deleteStudent(@RequestBody Student student){
        studentService.deleteStudent(student);
        return ResponseEntity.noContent().build();
    }

    //delete by id
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deleteStudentById(@PathVariable int id){
        studentService.deleteStudentById(id);
        return ResponseEntity.noContent().build();
    }
}
