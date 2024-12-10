package com.example.A_Learning_Springboot.repositories;

import com.example.A_Learning_Springboot.entities.Pw;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PwRepository extends JpaRepository<Pw, Integer> {
}
