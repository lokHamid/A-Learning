package com.example.A_Learning_Springboot.entities;
import jakarta.persistence.*;

@Entity
@Table(name="admins")
@PrimaryKeyJoinColumn(name="id_admin")
public class Teacher extends User{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_teacher;
    public Teacher(int id_user,String first_name, String last_name, int age, String email, String password,String pass_salt,Role role) {
        super(id_user,first_name,last_name,age,email,password,pass_salt,role);
        this.id_teacher = id_user;
    }

    public Teacher(){}

    public int getId_teacher() {
        return id_teacher;
    }

    public void setId_teacher(int id_teacher) {
        this.id_teacher = id_teacher;
    }
}
