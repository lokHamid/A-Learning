package com.example.A_Learning_Springboot.entities;

public class Teacher extends User{
    //stuff here , ill add it later :3
    public Teacher(int id,String first_name, String last_name, int age, String email, String password,String pass_salt,Role role) {
        super(id,first_name,last_name,age,email,password,pass_salt,role);
    }
}
