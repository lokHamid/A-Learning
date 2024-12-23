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

    public List<Admin> getAllAdmins(){
        return adminRepository.findAll();
    }

    public Optional<Admin> getAdminsById(int id){
        return adminRepository.findById(id);
    }
    public Admin saveAdmin(Admin admin){
        saveUser(admin);
        adminRepository.save(admin);
        return admin;
    }

    public Admin saveAdminById(int id, Admin admin) {
        Optional<Admin> adminOptional = adminRepository.findById(id);
        if(adminOptional.isPresent()){
            Admin newAdmin = adminOptional.get();
            newAdmin.setFirstName(admin.getFirstName());
            newAdmin.setLastName(admin.getLastName());
            newAdmin.setEmail(admin.getEmail());
            newAdmin.setPassword(admin.getPassword());
            newAdmin.setRole(admin.getRole());
            adminRepository.save(newAdmin);
            return newAdmin;
        }
        return null;
    }
    public void deleteAdmin(Admin admin){delete(admin);
    }
    public void deleteAdminById(int id) {
        adminRepository.deleteById(id);
    }

}
