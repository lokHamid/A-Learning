package com.example.A_Learning_Springboot.entities;

import jakarta.persistence.*;

@Entity
@Table(name="feedbacks")
public class Feedback {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_feedback;

    public int getId_feedback() {
        return id_feedback;
    }

    public void setId_feedback(int id_feedback) {
        this.id_feedback = id_feedback;
    }
    private String comment;

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
    private int grade;

    public int getGrade() {
        return grade;
    }
    public void setGrade(int grade) {
        this.grade = grade;
    }

    public Feedback(){}
}
