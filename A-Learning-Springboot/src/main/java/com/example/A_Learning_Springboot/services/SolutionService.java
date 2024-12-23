package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.Solution;
import com.example.A_Learning_Springboot.repositories.SolutionRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SolutionService {

    private final SolutionRepository solutionRepository;

    public SolutionService(SolutionRepository solutionRepository) {
        this.solutionRepository = solutionRepository;
    }

    public List<Solution> getAllSolutions(){
        return solutionRepository.findAll();
    }

    public Optional<Solution> getSolutionById(int id){
        return solutionRepository.findById(id);
    }

    public Solution saveSolution(Solution solution){
        return solutionRepository.save(solution);
    }

    public void deleteSolution(Solution solution){
        solutionRepository.delete(solution);
    }

}
