package com.example.A_Learning_Springboot.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import org.springframework.data.annotation.Id;

import java.util.Date;

public class Student extends User {
    private String group;
    private String scholar_year;
    private int id_level; // turn this a foreign key somehow!

    public Student(int id,String first_name, String last_name, int age, String email, String password,String pass_salt,Role role) {
        super(id,first_name,last_name,age,email,password,pass_salt,role);
    }

    public Student() {}
}
