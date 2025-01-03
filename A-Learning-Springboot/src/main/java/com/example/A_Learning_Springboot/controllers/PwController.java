package com.example.A_Learning_Springboot.controllers;

import com.example.A_Learning_Springboot.entities.*;
import com.example.A_Learning_Springboot.repositories.CourseRepository;
import com.example.A_Learning_Springboot.services.FileClassService;
import com.example.A_Learning_Springboot.services.PwService;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/pw")
public class PwController {

    @Autowired
    private final PwService pwService;
    @Autowired
    private CourseRepository courseRepository;
    @Autowired
    FileClassService fileClassService;
    public PwController(PwService pwService) {
        this.pwService = pwService;
    }

    //read:
    @GetMapping("/all")
    public List<Pw> getAllPws(){
        return pwService.getAllPws();
    }

    //read by id:
    @GetMapping("/{courseId}")
    public ResponseEntity<?> getPwsByCourseId(@PathVariable String courseId) {
        List<Pw> pws = pwService.getPwById(courseId);
        if (pws.isEmpty()) {
            return ResponseEntity
                    .notFound()
                    .build();
        }
        return ResponseEntity.ok(pws);
    }

    //create
    @PostMapping("/add")
    public Pw addPw(@RequestBody PWDTO pwdto){
        Course course=courseRepository.getReferenceById(pwdto.getCourseName());
        System.out.println("Course fetched: " + course.getCourse_name());
        Pw pw=new Pw();
        pw.setPwname(pwdto.getPwname());
        pw.setMaterials(pwdto.getMaterials());
        pw.setObjectives(pwdto.getObjectives());
        pw.setSteps(pwdto.getSteps());
        pw.setCourse_id(course);
        pw.setSubmissiondeadline(pwdto.getSubmissiondeadline());

        List<FileClass> fileClasses = new ArrayList<>();
        for (FileDTO fileDTO : pwdto.getFiles()) {
            FileClass file = new FileClass();
            file.setFilename(fileDTO.getFilename());
            file.setUrl_file(fileDTO.getUrl_file());
            file.setRole(fileDTO.getRole());
            if (fileDTO.getId_solution() != null) {
                file.setIdPw(fileDTO.getIdPw());
            }
            fileClasses.add(file); // This line was already in place.
        }

        pw.setFiles(fileClasses);
       Pw savedpw = pwService.savePw(pw);

       if(!pwdto.getFiles().isEmpty()) {
            for (FileClass file : savedpw.getFiles()) {
                file.setIdPw(savedpw.getPwId());
                fileClassService.save(file);  // Save file with the correct idSolution
            }
        }

       return savedpw;
    }

    //update
    @PutMapping("/update")
    public ResponseEntity<Pw> updatePw(@RequestBody Pw pw){
        Pw newPw = pwService.savePw(pw);
        return new ResponseEntity<>(newPw, org.springframework.http.HttpStatus.OK);
    }

    //update by id
    @PutMapping("/update/{id}")
    public ResponseEntity<Pw> updatePwById(@PathVariable int id, @RequestBody Pw pw) {

        Pw existingPw = pwService.getPwById(id);
      System.out.println("existingPw fetched: " + existingPw.getPwname());
        // Update fields of the existing Pw entity with the incoming Pw object
        existingPw.setObjectives(pw.getObjectives());
        existingPw.setMaterials(pw.getMaterials());
        existingPw.setSteps(pw.getSteps());
        existingPw.setPwname(pw.getPwname());
        existingPw.setSubmissiondeadline(pw.getSubmissiondeadline());
        existingPw.setFiles(pw.getFiles());


        // Save the updated entity
        Pw updatedPw = pwService.savePw(existingPw);

        // Return the updated entity
        return ResponseEntity.ok(updatedPw);
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
