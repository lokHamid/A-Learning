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

    public Teacher saveTeacherById(int id, Teacher teacher) {
        Optional<Teacher> teacherOptional = teacherRepository.findById(id);
        if(teacherOptional.isPresent()){
            Teacher newTeacher = teacherOptional.get();
            newTeacher.setFirstName(teacher.getFirstName());
            newTeacher.setLastName(teacher.getLastName());
            newTeacher.setEmail(teacher.getEmail());
            newTeacher.setPassword(teacher.getPassword());
            newTeacher.setRole(teacher.getRole());
            teacherRepository.save(newTeacher);
            return newTeacher;
        }
        return null;
    }

    public void deleteTeacher(Teacher teacher){
        delete(teacher);
    }

    public void deleteTeacherById(int id) {
        teacherRepository.deleteById(id);
    }
}
