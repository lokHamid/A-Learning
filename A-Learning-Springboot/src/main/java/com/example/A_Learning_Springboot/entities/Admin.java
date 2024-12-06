package com.example.A_Learning_Springboot.entities;

import jakarta.persistence.*;

@Entity
@Table(name="admins")
@PrimaryKeyJoinColumn(name="id_admin")
public class Admin extends User{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_admin;
    public Admin(int id_user,String first_name, String last_name, int age, String email, String password,String pass_salt,Role role) {
        super(id_user,first_name,last_name,age,email,password,pass_salt,role);
        this.id_admin = id_user;
    }

    public Admin(){}

    public int getId_admin() {
        return id_admin;
    }

    public void setId_admin(int id_admin) {
        this.id_admin = id_admin;
    }
}
