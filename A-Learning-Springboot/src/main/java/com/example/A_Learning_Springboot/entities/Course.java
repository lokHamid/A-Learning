package com.example.A_Learning_Springboot.entities;


import jakarta.persistence.*;

@Entity
@Table(name="courses")
public class Course {

    @Id
    private String id_course;
    private String course_name;
    private String teacher_name;
    private int coefficient;
    @Enumerated(EnumType.STRING)
    private Level level;

    // change to foreign key relation after:
    private int teacherID;

    public Course() {
    }
    public Course(String id_course, String course_name, int coefficient, Level level) {
        this.id_course = id_course;
        this.coefficient = coefficient;
        this.level = level;
    }

    public String getIdCourse() {
        return id_course;
    }
    public void setIdCourse(String id_course) {
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

    public int getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(int teacherID) {
        this.teacherID = teacherID;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getTeacher_name() {
        return teacher_name;
    }

    public void setTeacher_name(String teacher_name) {
        this.teacher_name = teacher_name;
    }
}
