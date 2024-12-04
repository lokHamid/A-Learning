package com.example.A_Learning_Springboot.controllers;


import com.example.A_Learning_Springboot.entities.User;
import com.example.A_Learning_Springboot.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {
    @Autowired
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/all")
    public List<User> getAllStudents() {
        return userService.findall();
    }

    @PostMapping("/add")
    public User addUser(@RequestBody User user) {
        userService.saveUser(user);
        return user;
    }
}
