package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.Student;
import com.example.A_Learning_Springboot.repositories.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StudentService extends UserService{
    StudentRepository studentRepository;
    @Autowired
    public StudentService(StudentRepository studentRepository){
        this.studentRepository = studentRepository;
    }

    public List<Student> getallstudents(){
        return studentRepository.findAll();
    }

    public Optional<Student> getstudentbyid(int id){
        return studentRepository.findById(id);
    }
    public Student saveStudent(Student student){
        saveUser(student);
        studentRepository.save(student);
        return student;
    }
    public void deleteStudent(Student student){
        delete(student);
    }
}
