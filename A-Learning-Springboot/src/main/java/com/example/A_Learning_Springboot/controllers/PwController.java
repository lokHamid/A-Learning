package com.example.A_Learning_Springboot.controllers;

import com.example.A_Learning_Springboot.entities.Pw;
import com.example.A_Learning_Springboot.services.PwService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/pw")
public class PwController {

    @Autowired
    private final PwService pwService;

    public PwController(PwService pwService) {
        this.pwService = pwService;
    }

    //read:
    @GetMapping("/all")
    public List<Pw> getAllPws(){
        return pwService.getAllPws();
    }

    //read by id:
    @GetMapping("/all/{id}")
    public ResponseEntity<Pw> getPwById(@PathVariable int id){
        Optional<Pw> pw = pwService.getPwById(id);
        return ResponseEntity.ok(pw.orElse(null));
    }

    //create
    @PostMapping("/add")
    public Pw addPw(@RequestBody Pw pw){

        return pwService.savePw(pw);
    }

    //update
    @PutMapping("/update")
    public ResponseEntity<Pw> updatePw(@RequestBody Pw pw){
        Pw newPw = pwService.savePw(pw);
        return new ResponseEntity<>(newPw, org.springframework.http.HttpStatus.OK);
    }

    //update by id
    @PutMapping("/update/{id}")
    public ResponseEntity<Pw> updatePwById(@PathVariable int id, @RequestBody Pw pw){
        Pw newPw = pwService.savePwById(id, pw);
        return new ResponseEntity<>(newPw, org.springframework.http.HttpStatus.OK);
    }

    //delete
    @DeleteMapping("/delete")
    public ResponseEntity<Void> deletePw(@RequestBody Pw pw){
        pwService.deletePw(pw);
        return ResponseEntity.noContent().build();
    }

    //delete by id
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deletePwById(@PathVariable int id){
        pwService.deletePwById(id);
        return ResponseEntity.noContent().build();
    }
}
