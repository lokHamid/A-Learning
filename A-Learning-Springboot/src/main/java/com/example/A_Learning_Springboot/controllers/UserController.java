package com.example.A_Learning_Springboot.controllers;


import com.example.A_Learning_Springboot.entities.Role;
import com.example.A_Learning_Springboot.entities.User;
import com.example.A_Learning_Springboot.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/user")
public class UserController {
    @Autowired
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }
    //read
    @GetMapping("/studentnumber")
    public int getStudentNumber() {
        return  userService.Studentcount();
    }

    @GetMapping("/all")
    public List<User> getAllUsers() {
        List<User> use = new ArrayList<>();
        for (User u : userService.findall()) {
            if (!u.getRole().equals(Role.ADMIN)) {  // Exclude admins if needed
                use.add(u);
            }
        }
        return use;
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
        return userService.saveUser(user);
    }
    //update
    @PutMapping("/update")
    public ResponseEntity<User> updateUser(@RequestBody User user) {
        User newUser = userService.saveUser(user);
        return new ResponseEntity<>(newUser, HttpStatus.OK);
    }

    //delete
    @DeleteMapping("/delete")
    public ResponseEntity<Void> deleteUser(@RequestBody User user) {
        userService.delete(user);
        return ResponseEntity.noContent().build();
    }

    //delete by id
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable int id) {
        userService.deletebyid(id);
        return ResponseEntity.noContent().build();
    }

}
