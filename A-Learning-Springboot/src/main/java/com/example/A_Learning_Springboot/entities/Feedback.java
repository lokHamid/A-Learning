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
    @ManyToOne
    @JoinColumn(name = "id_solution", foreignKey = @ForeignKey(name = "feedbacks_id_solution_fkey"))
    private Solution id_solution;

    public Solution getId_solution() {
        return id_solution;
    }

    public void setId_solution(Solution id_solution) {
        this.id_solution = id_solution;
    }

    public Feedback(){}
    public Feedback(String comment, int grade, Solution id_solution) {
        this.comment = comment;
        this.grade = grade;
        this.id_solution = id_solution;
    }

}
