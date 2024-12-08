package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.Teacher;
import com.example.A_Learning_Springboot.repositories.TeacherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class TeacherService extends UserService{
    TeacherRepository teacherRepository;
    @Autowired
    public TeacherService(TeacherRepository teacherRepository){
        this.teacherRepository = teacherRepository;
    }

    public List<Teacher> getAllTeachers(){
        return teacherRepository.findAll();
    }

    public Optional<Teacher> getTeacherById(int id){
        return teacherRepository.findById(id);
    }
    public Teacher saveTeacher(Teacher teacher){
        saveUser(teacher);
        teacherRepository.save(teacher);
        return teacher;
    }
    public void deleteTeacher(Teacher teacher){
        delete(teacher);
    }
}
