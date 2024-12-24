package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.Feedback;
import com.example.A_Learning_Springboot.repositories.FeedbackRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FeedbackService {

    private final FeedbackRepository feedbackRepository;

    public FeedbackService(FeedbackRepository feedbackRepository) {
        this.feedbackRepository = feedbackRepository;
    }

    public List<Feedback> getAllFeedbacks() {
        return feedbackRepository.findAll();
    }

    public Optional<Feedback> getFeedbackById(int id) {
        return feedbackRepository.findById(id);
    }

    public Feedback saveFeedback(Feedback feedback) {
        feedbackRepository.save(feedback);
        return feedback;
    }
    public void deleteFeedback(Feedback feedback){
        feedbackRepository.delete(feedback);
    }

    public void deleteFeedbackById(int id) {
        feedbackRepository.deleteById(id);
    }

}
