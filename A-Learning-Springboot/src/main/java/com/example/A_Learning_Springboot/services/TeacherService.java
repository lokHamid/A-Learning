package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.Teacher;
import com.example.A_Learning_Springboot.entities.User;
import com.example.A_Learning_Springboot.repositories.TeacherRepository;
import com.example.A_Learning_Springboot.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeacherService extends UserService{
    TeacherRepository teacherRepository;
    @Autowired
    public TeacherService(TeacherRepository teacherRepository){
        this.teacherRepository = teacherRepository;
    }
    public Teacher saveTeacher(Teacher teacher){
        saveUser(teacher);
        teacherRepository.save(teacher);
        return teacher;
    }

    public Teacher updateTeacher(Teacher teacher){
        saveUser(teacher);
        teacherRepository.save(teacher);
        return teacher;
    }

    public void deleteTeacher(Teacher teacher){
        teacherRepository.delete(teacher);
    }
}
