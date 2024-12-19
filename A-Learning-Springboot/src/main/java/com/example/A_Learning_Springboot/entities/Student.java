package com.example.A_Learning_Springboot.entities;
import jakarta.persistence.*;

@Entity
@Table(name="students")
@PrimaryKeyJoinColumn(name="id_student")
public class Student extends User {
    @Column(name="\"group\"")
    private String group;
    private String scholar_year;
    @Enumerated(EnumType.STRING)
    private Level level;

    public Student() {}

    public String getScholar_year() {
        return scholar_year;
    }

    public void setScholar_year(String scholar_year) {
        this.scholar_year = scholar_year;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public Level getLevel() {
        return level;
    }

    public void setLevel(Level level) {
        this.level = level;
    }
}
