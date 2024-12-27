package com.example.A_Learning_Springboot.entities;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "solutions")
public class Solution {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_solution;
    private String solution;
    @ManyToOne
    @JoinColumn(name = "id_student", foreignKey = @ForeignKey(name = "solutions_id_student_fkey"))
    private User ref_student;
    @ManyToOne
    @JoinColumn(name = "id_pw", foreignKey = @ForeignKey(name = "pwsolutions_id_pw_fkey"))
    private Pw ref_pw;
    @ManyToOne
    @JoinColumn(name = "id_feedback", foreignKey = @ForeignKey(name = "pwsolutions_id_feedback_fkey"))
    private Feedback ref_feedback;
    @OneToMany(mappedBy = "ref_solution", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<FileClass> files;

    public Solution(){}

    public Solution(String solution, User ref_student, Pw ref_pw, Feedback ref_feedback) {
        this.solution = solution;
        this.ref_student = ref_student;
        this.ref_pw = ref_pw;
        this.ref_feedback = ref_feedback;
    }

    public int getIdSolution() {
        return id_solution;
    }

    public void setIdSolution(int id_solution) {
        this.id_solution = id_solution;
    }

    public String getSolution() {
        return solution;
    }

    public void setSolution(String solution) {
        this.solution = solution;
    }

   /* public User getRefStudent() {
        return ref_student;
    }*/
    public void setRefStudent(User ref_student) {
        this.ref_student = ref_student;
    }

   /* public Pw getRefPw() {
        return ref_pw;
    }*/
    public void setRefPw(Pw ref_pw) {
        this.ref_pw = ref_pw;
    }

    /*public Feedback getRefFeedback() {
        return ref_feedback;
    }
*/
    public void setRefFeedback(Feedback ref_feedback) {
        this.ref_feedback = ref_feedback;
    }

    public int getId_solution() {
        return id_solution;
    }

    public void setId_solution(int id_solution) {
        this.id_solution = id_solution;
    }

    /*public User getRef_student() {
        return ref_student;
    }
*/
    public void setRef_student(User ref_student) {
        this.ref_student = ref_student;
    }



    public void setRef_pw(Pw ref_pw) {
        this.ref_pw = ref_pw;
    }

   /* public Feedback getRef_feedback() {
        return ref_feedback;
    }
*/
    public void setRef_feedback(Feedback ref_feedback) {
        this.ref_feedback = ref_feedback;
    }

    public List<FileClass> getFiles() {
        return files;
    }

    public void setFiles(List<FileClass> files) {
        this.files = files;
    }
}

