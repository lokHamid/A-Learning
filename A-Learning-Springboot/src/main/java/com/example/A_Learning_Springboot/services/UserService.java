package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.User;
import com.example.A_Learning_Springboot.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public void saveUser(User user){
        userRepository.save(user);
    }

    public List<User> findall(){
        return userRepository.findAll();
    }

    public Optional<User> findbyid(int id){
        return userRepository.findById(id);
    }

}
