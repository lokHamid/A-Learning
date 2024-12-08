package com.example.A_Learning_Springboot.controllers.toBeDeleted;

import com.example.A_Learning_Springboot.entities.Solution;
import com.example.A_Learning_Springboot.repositories.SolutionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/solution")
public class Solutioncontroller {

    private final SolutionRepository solutionRepository;

    @Autowired
    public Solutioncontroller(SolutionRepository solutionRepository) {
        this.solutionRepository = solutionRepository;
    }

    @GetMapping(value = "/getSolution", produces = "application/json")
    public List<Solution> getSolutions() {
        return solutionRepository.getSolutions();
    }

    @PostMapping(value = "/addSolution", consumes = "application/json", produces = "application/json")
    public Solution addSolution(@RequestBody Solution newSolution) {
        solutionRepository.addSolution(newSolution);
        return newSolution;
    }
}