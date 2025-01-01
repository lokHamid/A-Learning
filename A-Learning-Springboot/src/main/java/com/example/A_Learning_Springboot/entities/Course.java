package com.example.A_Learning_Springboot.entities;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name="courses")
public class Course {

    @Id
    @Column(name = "id_course")
    private String idCourse;
    private String course_name;

    private int coefficient;
    @Enumerated(EnumType.STRING)
    private Level level;

    // change to foreign key relation after:

    @ManyToMany
    @JsonIgnore
    @JoinTable(
            name = "course_teacher",
            joinColumns = @JoinColumn(name = "course_id"),
            inverseJoinColumns = @JoinColumn(name = "teacher_id")
    )

    private List<User> teachers;
    // Add getter and setter
   /* public List<User> getTeachers() {
        return teachers;
    }*/
    public void setTeachers(List<User> teachers) {
        this.teachers = teachers;
    }


    public Course() {
    }
    public Course(String id_course, String course_name, int coefficient, Level level) {
        this.idCourse = id_course;
        this.coefficient = coefficient;
        this.level = level;
    }

    public String getIdCourse() {
        return idCourse;
    }
    public void setIdCourse(String id_course) {
        this.idCourse = id_course;
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


    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }


}
