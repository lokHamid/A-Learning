package com.example.A_Learning_Springboot.entities;
import jakarta.persistence.*;

@Entity
@Table(name="teachers")
@PrimaryKeyJoinColumn(name="id_admin")
public class Teacher extends User{
    public Teacher(int id_user,String first_name, String last_name, int age, String email, String password,String pass_salt,Role role) {
        super(id_user,first_name,last_name,age,email,password,pass_salt,role);
    }

    public Teacher(){}
}
