package com.example.A_Learning_Springboot.entities;

public class Student extends User {

    public Student(int id,String first_name, String last_name, int age, String email, String password,Role role) {
        super(id,first_name,last_name,age,email,password,role);
    }
}
