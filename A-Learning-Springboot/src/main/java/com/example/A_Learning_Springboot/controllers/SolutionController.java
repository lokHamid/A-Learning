package com.example.A_Learning_Springboot.controllers;

import com.example.A_Learning_Springboot.entities.*;
import com.example.A_Learning_Springboot.repositories.FeedbackRepository;
import com.example.A_Learning_Springboot.repositories.PwRepository;
import com.example.A_Learning_Springboot.repositories.UserRepository;
import com.example.A_Learning_Springboot.services.FileClassService;
import com.example.A_Learning_Springboot.services.SolutionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/solution")
public class SolutionController {


    @Autowired
    private UserRepository userRepository;   // Assuming you have this repository
    @Autowired
    private PwRepository pwRepository;       // Assuming you have this repository
    @Autowired
    private FeedbackRepository feedbackRepository;
    @Autowired
    private SolutionService solutionService;
    @Autowired
    FileClassService fileClassService;

    public SolutionController(SolutionService solutionService) {
        this.solutionService = solutionService;
    }

    //read:
    @GetMapping("/all")
    public List<Solution> getAllSolutions(){
        return solutionService.getAllSolutions();
    }

    //read by id:
    @GetMapping("/all/{id}")
    public ResponseEntity<List<Solution>> getSolutionById(@PathVariable  int id){
        List<Solution> solutions = solutionService.getSolutionById(id);
        return solutions == null ? ResponseEntity.notFound().build() : ResponseEntity.ok(solutions);
    }

    //create
    @PostMapping("/add")
    public Solution addSolution(@RequestBody SolutionDTO solutionDTO) {
        // Fetch related entities
        User user = userRepository.findById(solutionDTO.getRef_student())
                .orElseThrow(() -> new RuntimeException("User not found"));
        Pw pw = pwRepository.findById(solutionDTO.getRef_pw())
                .orElseThrow(() -> new RuntimeException("Pw not found"));
        Feedback feedback = solutionDTO.getRef_feedback() != null ?
                feedbackRepository.findById(solutionDTO.getRef_feedback())
                        .orElseThrow(() -> new RuntimeException("Feedback not found")) : null;

        // Create Solution entity
        Solution solution = new Solution();
        solution.setSolution(solutionDTO.getSolution());
        solution.setRef_student(user);
        solution.setRefPw(pw);
        if(solutionDTO.getRef_feedback() != null){
        solution.setRef_feedback(feedback);
           }
        // Handle files, but don't set idSolution yet
        List<FileClass> fileClasses = new ArrayList<>();
        for (FileDTO fileDTO : solutionDTO.getFiles()) {
            FileClass file = new FileClass();
            file.setFilename(fileDTO.getFilename());
            file.setUrl_file(fileDTO.getUrl_file());
            file.setRole(fileDTO.getRole());
            if (fileDTO.getIdPw() != null) {
                file.setIdPw(fileDTO.getIdPw());
            }

            // Do not set idSolution here, because solution is not saved yet
            fileClasses.add(file);
        }
        solution.setFiles(fileClasses);

        // Save Solution first to generate the id_solution
        Solution savedSolution = solutionService.saveSolution(solution);

        // Now that the Solution has an id_solution, set the idSolution on the files and save them
        if(!solutionDTO.getFiles().isEmpty()) {
            for (FileClass file : savedSolution.getFiles()) {
                file.setIdSolution(savedSolution.getId_solution());
                fileClassService.save(file);  // Save file with the correct idSolution
            }
        }
        return savedSolution;
    }

    //update
    @PutMapping("/update")
    public ResponseEntity<Solution> updateSolution(@RequestBody Solution solution){
        Solution newSolution = solutionService.saveSolution(solution);
        return new ResponseEntity<>(newSolution, org.springframework.http.HttpStatus.OK);
    }

    //update by id
    @PutMapping("/update/{id}")
    public ResponseEntity<Solution> updateSolutionById(@PathVariable int id, @RequestBody Solution solution){
        Solution newSolution = solutionService.saveSolutionById(id, solution);
        return new ResponseEntity<>(newSolution, org.springframework.http.HttpStatus.OK);
    }

    //delete
    @DeleteMapping("/delete")
    public ResponseEntity<Void> deleteSolution(@RequestBody Solution solution){
        solutionService.deleteSolution(solution);
        return ResponseEntity.noContent().build();
    }

    //delete by id
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deleteSolutionById(@PathVariable int id){
        solutionService.deleteSolutionById(id);
        return ResponseEntity.noContent().build();
    }

}
