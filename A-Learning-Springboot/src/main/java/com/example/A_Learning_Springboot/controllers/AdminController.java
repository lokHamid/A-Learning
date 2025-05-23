package com.example.A_Learning_Springboot.controllers;

import com.example.A_Learning_Springboot.entities.Admin;
import com.example.A_Learning_Springboot.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/admin")
public class AdminController {

    @Autowired
    private final AdminService adminService;

    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    //read:
    @GetMapping("/all")
    public List<Admin> getAllAdmins(){
        return adminService.getAllAdmins();
    }

    //read by id:
    @GetMapping("/all/{id}")
    public ResponseEntity<Admin> getAdminById(@PathVariable int id){
        Optional<Admin> admin = adminService.getAdminsById(id);
        return admin.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    //create
    @PostMapping("/add")
    public Admin addAdmin(@RequestBody Admin admin){
        return adminService.saveAdmin(admin);
    }

    //update
    @PutMapping("/update")
    public ResponseEntity<Admin> updateAdmin(@RequestBody Admin admin){
        Admin newAdmin = adminService.saveAdmin(admin);
        return new ResponseEntity<>(newAdmin, org.springframework.http.HttpStatus.OK);
    }

    //update by id
    @PutMapping("/update/{id}")
    public ResponseEntity<Admin> updateAdminById(@PathVariable int id, @RequestBody Admin admin){
        Admin newAdmin = adminService.saveAdminById(id, admin);
        return new ResponseEntity<>(newAdmin, org.springframework.http.HttpStatus.OK);
    }

    //delete
    @DeleteMapping("/delete")
    public ResponseEntity<Void> deleteAdmin(@RequestBody Admin admin){
        adminService.deleteAdmin(admin);
        return ResponseEntity.noContent().build();
    }

    //delete by id
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deleteAdminById(@PathVariable int id){
        adminService.deleteAdminById(id);
        return ResponseEntity.noContent().build();
    }
}
