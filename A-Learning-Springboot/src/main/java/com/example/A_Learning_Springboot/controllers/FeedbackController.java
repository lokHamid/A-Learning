package com.example.A_Learning_Springboot.controllers;

import com.example.A_Learning_Springboot.entities.Feedback;
import com.example.A_Learning_Springboot.services.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping( "/api/feedback")
public class FeedbackController {

    @Autowired
    private final FeedbackService feedbackService;

    public FeedbackController(FeedbackService feedbackService) {
        this.feedbackService = feedbackService;
    }

    //read:
    @GetMapping("/all")
    public List<Feedback> getAllFeedbacks(){
        return feedbackService.getAllFeedbacks();
    }

    //read by id:
    @GetMapping("/all/{id}")
    public ResponseEntity<Feedback> getFeedbackById(@PathVariable int id){
        Optional<Feedback> feedback = feedbackService.getFeedbackById(id);
        return ResponseEntity.ok(feedback.orElse(null));
    }

    //read by pw id + user id:
    @GetMapping("/get-by-pw-user/{pwid}/{userid}")
    public ResponseEntity<Feedback> getFeedbackByUser(@PathVariable int pwid, @PathVariable int userid){
        Feedback feedback = feedbackService.getFeedbackByUser(pwid,userid);
        return ResponseEntity.ok(feedback);
    }

    //create
    @PostMapping("/add")
    public Feedback addFeedback(@RequestBody Feedback feedback){
        return feedbackService.saveFeedback(feedback);
    }

    //update
    @PutMapping("/update")
    public ResponseEntity<Feedback> updateFeedback(@RequestBody Feedback feedback){
        Feedback newFeedback = feedbackService.saveFeedback(feedback);
        return new ResponseEntity<>(newFeedback, org.springframework.http.HttpStatus.OK);
    }

    //delete
    @DeleteMapping("/delete")
    public ResponseEntity<Void> deleteFeedback(@RequestBody Feedback feedback){
        feedbackService.deleteFeedback(feedback);
        return ResponseEntity.noContent().build();
    }

    //delete by id
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deleteFeedbackById(@PathVariable int id){
        feedbackService.deleteFeedbackById(id);
        return ResponseEntity.noContent().build();
    }


}
