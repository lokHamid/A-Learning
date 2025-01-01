package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.Role;
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
    public Optional<User> getUserById(int id) {
        return userRepository.findById(id);
    }
    public Optional<User> validateCredentials(String email, String password) {
        // Find user by email
        Optional<User> userOptional = userRepository.findByEmail(email);
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            // Compare provided password with stored password directly
            if (password.equals(user.getPassword())) {
                return Optional.of(user);  // Return user if passwords match
            }
        }
        return Optional.empty();  // Return empty if user not found or passwords don't match
    }
    public List<User> findall(){
        return userRepository.findAll();
    }

    public Optional<User> findbyid(int id){
        return userRepository.findById(id);
    }

    public User saveUser(User user){
        userRepository.save(user);
        return user;
    }

    public User saveUserById(User user) {
        Optional<User> userOptional = userRepository.findById(user.getIdUser());
        if (userOptional.isPresent()) {
            User newUser = userOptional.get();
            newUser.setEmail(user.getEmail());
            newUser.setRole(user.getRole());
            newUser.setLastName(user.getLastName());
            newUser.setFirstName(user.getFirstName());
            newUser.setPassword(user.getPassword());
            newUser.setPassSalt(user.getPassSalt());
            userRepository.save(newUser);
            return newUser;
        } else {
            return null;
        }
    }
    
    public void deletebyid(int id){
        userRepository.deleteById(id);
    }

    public void delete(User user){
        userRepository.delete(user);
    }
    public int Studentcount(){
        return userRepository.countByRole(Role.STUDENT);
    }
}
