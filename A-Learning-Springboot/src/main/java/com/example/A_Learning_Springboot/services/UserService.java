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

    public User saveUser(User user){
        userRepository.save(user);
        return user;
    }

    public List<User> findall(){
        return userRepository.findAll();
    }

    public Optional<User> findbyid(int id){
        return userRepository.findById(id);
    }
    
    public void deletebyid(int id){
        userRepository.deleteById(id);
    }

    public void delete(User user){
        userRepository.delete(user);
    }

}
