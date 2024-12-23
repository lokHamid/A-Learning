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

    public Student saveStudentById(int id, Student student) {
        Optional<Student> studentOptional = studentRepository.findById(id);
        if(studentOptional.isPresent()){
            Student newStudent = studentOptional.get();
            newStudent.setFirstName(student.getFirstName());
            newStudent.setLastName(student.getLastName());
            newStudent.setEmail(student.getEmail());
            newStudent.setPassword(student.getPassword());
            newStudent.setRole(student.getRole());
            studentRepository.save(newStudent);
            return newStudent;
        }
        return null;

    }

    public void deleteStudent(Student student){
        delete(student);
    }

    public void deleteStudentById(int id) {
        studentRepository.deleteById(id);
    }
}
