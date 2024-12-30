package com.example.A_Learning_Springboot.entities;

import java.util.List;

public class SolutionDTO {
    private String solution;
    private int ref_student;    // ID of the user
    private int ref_pw;         // ID of the Pw
    private Integer ref_feedback; // ID of the feedback (nullable)
    private List<FileDTO> files; // Assuming you're using a FileDTO

    public String getSolution() {
        return solution;
    }

    public void setSolution(String solution) {
        this.solution = solution;
    }

    public int getRef_student() {
        return ref_student;
    }

    public void setRef_student(int ref_student) {
        this.ref_student = ref_student;
    }

    public int getRef_pw() {
        return ref_pw;
    }

    public void setRef_pw(int ref_pw) {
        this.ref_pw = ref_pw;
    }

    public Integer getRef_feedback() {
        return ref_feedback;
    }

    public void setRef_feedback(Integer ref_feedback) {
        this.ref_feedback = ref_feedback;
    }

    public List<FileDTO> getFiles() {
        return files;
    }

    public void setFiles(List<FileDTO> files) {
        this.files = files;
    }
}
