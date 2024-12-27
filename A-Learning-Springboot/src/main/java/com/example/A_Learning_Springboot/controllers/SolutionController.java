package com.example.A_Learning_Springboot.controllers;

import com.example.A_Learning_Springboot.entities.Pw;
import com.example.A_Learning_Springboot.entities.Solution;
import com.example.A_Learning_Springboot.services.SolutionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/solution")
public class SolutionController {

    @Autowired
    private SolutionService solutionService;

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
    public ResponseEntity<Solution> getSolutionById(@PathVariable int id){
        Solution solution = solutionService.getSolutionById(id);
        return solution == null ? ResponseEntity.notFound().build() : ResponseEntity.ok(solution);
    }

    //create
    @PostMapping("/add")
    public Solution addSolution(@RequestBody Solution solution){
        return solutionService.saveSolution(solution);
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
