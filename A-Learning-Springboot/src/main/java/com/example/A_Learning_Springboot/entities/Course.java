package com.example.A_Learning_Springboot.entities;


import jakarta.persistence.*;

@Entity
@Table(name="courses")
public class Course {
    @Id
    private String id_course;
    private int coefficient;
    @Enumerated(EnumType.STRING)
    private Level level;

    public Course() {
    }
    public Course(String id_course, int coefficient, Level level) {
        this.id_course = id_course;
        this.coefficient = coefficient;
        this.level = level;
    }
    public String getId_course() {
        return id_course;
    }
    public void setId_course(String id_course) {
        this.id_course = id_course;
    }

    public int getCoefficient() {
        return coefficient;
    }

    public void setCoefficient(int coefficient) {
        this.coefficient = coefficient;
    }

    public Level getLevel() {
        return level;
    }

    public void setLevel(Level level) {
        this.level = level;
    }
}
