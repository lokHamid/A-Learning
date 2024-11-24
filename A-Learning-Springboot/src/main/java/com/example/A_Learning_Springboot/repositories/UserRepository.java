package com.example.A_Learning_Springboot.repositories;


import com.example.A_Learning_Springboot.entities.Role;
import com.example.A_Learning_Springboot.entities.Student;
import jakarta.annotation.PostConstruct;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class UserRepository {
    private List<Student> students = new ArrayList<Student>();

    public List<Student> getStudents() {
        return students;
    }

    //return all students:
    public List<Student> getStudents(Role role) {
        return students;
    }

    @PostConstruct
    public void init() {
        Student std = new Student(1,"lokman","hamidi",20,"lokman.hamidi@univ-constantine2.dz","lokman", Role.STUDENT);
        students.add(std);
    }
}
