package com.example.A_Learning_Springboot.entities;

import jakarta.persistence.*;

@Entity
@Table(name="admins")
@PrimaryKeyJoinColumn(name="id_admin")
public class Admin extends User{
    public Admin(){}
}
