package com.example.A_Learning_Springboot.repositories;

import com.example.A_Learning_Springboot.entities.Feedback;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FeedbackRepository extends JpaRepository<Feedback , Integer> {
}
