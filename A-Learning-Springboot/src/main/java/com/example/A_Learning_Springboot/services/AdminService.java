package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.Admin;
import com.example.A_Learning_Springboot.entities.Student;
import com.example.A_Learning_Springboot.repositories.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Optional;

@Service
public class AdminService extends UserService{
    AdminRepository adminRepository;

    @Autowired
    public AdminService(AdminRepository adminRepository){
        this.adminRepository = adminRepository;
    }
    public Admin saveAdmin(Admin admin){
        saveUser(admin);
        adminRepository.save(admin);
        return admin;
    }

    public List<Admin> getAllAdmins(){
        return adminRepository.findAll();
    }

    public Optional<Admin> getAdminById(int id){
        return adminRepository.findById(id);
    }
    public void deleteAdmin(Admin admin){
        delete(admin);
    }
}
