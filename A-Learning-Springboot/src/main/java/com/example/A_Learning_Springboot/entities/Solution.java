package com.example.A_Learning_Springboot.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "solutions")
public class Solution {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_solution;
    private String solution;
    @ManyToOne
    @JoinColumn(name = "id_student", foreignKey = @ForeignKey(name = "pwsolutions_id_student_fkey"))
    private Student ref_student;
    @ManyToOne
    @JoinColumn(name = "id_pw", foreignKey = @ForeignKey(name = "pwsolutions_id_pw_fkey"))
    private Pw ref_pw;
    @ManyToOne
    @JoinColumn(name = "id_feedback", foreignKey = @ForeignKey(name = "pwsolutions_id_feedback_fkey"))
    private Feedback ref_feedback;

    public Solution(){}

    public Solution(String solution, Student ref_student, Pw ref_pw, Feedback ref_feedback) {
        this.solution = solution;
        this.ref_student = ref_student;
        this.ref_pw = ref_pw;
        this.ref_feedback = ref_feedback;
    }
}

