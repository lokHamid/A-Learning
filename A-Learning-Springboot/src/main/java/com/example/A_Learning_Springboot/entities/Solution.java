package com.example.A_Learning_Springboot.entities;

import java.io.File;
import java.util.List;

public class Solution {
    private String solution;
    private String studentname;
    private int id;
    private List<files> pdf;

    public Solution(String solution, String studentname, int id, List<files> pdf) {
        this.solution = solution;
        this.studentname = studentname;
        this.id = id;
        this.pdf = pdf;
    }

    public String getSolution() {
        return solution;
    }

    public String getStudentname() {
        return studentname;
    }

    public int getId() {
        return id;
    }

    public List<files> getPdf() {
        return pdf;
    }
}

