package com.example.A_Learning_Springboot.entities;


import jakarta.persistence.*;

@Entity
@Table(name="courses")
public class Course {

    @Id
    private String id_course;
    private String course_name;
    private int coefficient;
    @Enumerated(EnumType.STRING)
    private Level level;

    public Course() {
    }
    public Course(String id_course, String course_name, int coefficient, Level level) {
        this.id_course = id_course;
        this.course_name = course_name;
        this.coefficient = coefficient;
        this.level = level;
    }

    public String getIdCourse() {
        return id_course;
    }
    public void setIdCourse(String id_course) {
        this.id_course = id_course;
    }

    public String getCourseName() {
        return course_name;
    }

    public void setCourseName(String course_name) {
        this.course_name = course_name;
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
