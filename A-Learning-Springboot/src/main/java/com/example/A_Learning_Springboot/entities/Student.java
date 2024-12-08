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

    public Student(int id_user,String first_name, String last_name, int age, String email, String password,String pass_salt,Role role,String group,String scholar_year,Level level) {
        super(id_user,first_name,last_name,age,email,password,pass_salt,role);
        this.group = group;
        this.scholar_year = scholar_year;
        this.level = level;
    }

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
