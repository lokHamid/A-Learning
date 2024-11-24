package com.example.A_Learning_Springboot.controllers;


import com.example.A_Learning_Springboot.entities.Student;
import com.example.A_Learning_Springboot.repositories.UserRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/student")
public class StudentController {
    //necessary variables:
    private final UserRepository userRepository;

    public StudentController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/all")
    public List<Student> getAllStudents() {
        return userRepository.getStudents();
    }
}
