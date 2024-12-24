package com.example.A_Learning_Springboot.repositories;
import com.example.A_Learning_Springboot.entities.Role;
import com.example.A_Learning_Springboot.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository <User,Integer> {
    int countByRole(Role role);
    Optional<User> findByEmail(String email);

}
