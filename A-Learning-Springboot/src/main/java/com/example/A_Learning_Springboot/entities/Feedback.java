package com.example.A_Learning_Springboot.entities;

import jakarta.persistence.*;

@Entity
@Table(name="feedbacks")
public class Feedback {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_feedback;
    private String comment;
    private int grade;
    @ManyToOne
    @JoinColumn(name = "id_solution", foreignKey = @ForeignKey(name = "feedbacks_id_solution_fkey"))
    private Solution ref_solution;

    public Feedback(){}

    public int getIdFeedback() {
        return id_feedback;
    }

    public void setIdFeedback(int id_feedback) {
        this.id_feedback = id_feedback;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public Solution getRefSolution() {
        return ref_solution;
    }
    public void setRefSolution(Solution ref_solution) {
        this.ref_solution = ref_solution;
    }

}
