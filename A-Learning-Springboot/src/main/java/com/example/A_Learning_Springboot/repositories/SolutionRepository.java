package com.example.A_Learning_Springboot.repositories;

import com.example.A_Learning_Springboot.entities.Solution;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SolutionRepository extends JpaRepository<Solution , Integer> {
}
