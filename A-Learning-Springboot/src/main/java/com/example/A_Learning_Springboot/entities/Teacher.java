package com.example.A_Learning_Springboot.entities;
import jakarta.persistence.*;

@Entity
@Table(name="teachers")
@PrimaryKeyJoinColumn(name="id_admin")
public class Teacher extends User{
    public Teacher(){}
}
