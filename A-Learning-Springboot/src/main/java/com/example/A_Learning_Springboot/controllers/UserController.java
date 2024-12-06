package com.example.A_Learning_Springboot.controllers;


import com.example.A_Learning_Springboot.entities.User;
import com.example.A_Learning_Springboot.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }
    //read
    @GetMapping("/all")
    public List<User> getAllUsers() {
        return userService.findall();
    }
    //read by id
    @GetMapping("/all/{id}")
    public ResponseEntity<User> getUserById(@PathVariable int id) {
        Optional<User> user = userService.findbyid(id);
        return user.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    //create
    @PostMapping("/add")
    public User addUser(@RequestBody User user) {
        userService.saveUser(user);
        return user;
    }
    //update
    @PutMapping("/update")
    public ResponseEntity<User> updateUser(@RequestBody User user) {
        User newUser = userService.saveUser(user);
        return new ResponseEntity<>(newUser, HttpStatus.OK);
    }
    //delete
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable int id) {
        userService.deletebyid(id);
        return ResponseEntity.noContent().build();
    }
}
