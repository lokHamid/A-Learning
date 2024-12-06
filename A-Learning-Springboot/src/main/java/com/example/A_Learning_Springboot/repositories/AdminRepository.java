package com.example.A_Learning_Springboot.repositories;

import com.example.A_Learning_Springboot.entities.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminRepository extends JpaRepository<Admin, Integer> {
}
