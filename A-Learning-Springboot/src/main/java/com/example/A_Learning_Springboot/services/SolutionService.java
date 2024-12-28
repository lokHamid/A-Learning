package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.FileClass;
import com.example.A_Learning_Springboot.entities.Pw;
import com.example.A_Learning_Springboot.entities.Solution;
import com.example.A_Learning_Springboot.repositories.SolutionRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SolutionService {

    private final SolutionRepository solutionRepository;
    private final FileClassService fileClassService;

    public SolutionService(SolutionRepository solutionRepository, FileClassService fileClassService) {
        this.solutionRepository = solutionRepository;
        this.fileClassService = fileClassService;
    }

    public List<Solution> getAllSolutions(){
        return solutionRepository.findAll();
    }

    public Solution getSolutionById(int id){
        Solution solution = solutionRepository.findByPwId(id);
        if(solution != null){
            List<FileClass> files=fileClassService.findBySolutionId(solution.getId_solution());
            System.out.println("Fetched files: " + files);
            solution.setFiles(files);
        }
        return solution;
    }

    public Solution saveSolution(Solution solution) {
        Solution savedsolution = solutionRepository.save(solution);

        // Handle files separately
        if (solution.getFiles() != null) {
            for (FileClass file : solution.getFiles()) {

                file.setRef_solution (savedsolution);
                fileClassService.save(file); // Save the file
            }

        }
        return savedsolution;
    }

    public Solution saveSolutionById(int id, Solution solution) {
        Optional<Solution> solutionOptional = solutionRepository.findById(id);
        if(solutionOptional.isPresent()){
            Solution newSolution = solutionOptional.get();
            newSolution.setIdSolution(solution.getIdSolution());
            newSolution.setSolution(solution.getSolution());

            return solutionRepository.save(newSolution);
        }
        return null;
    }

    public void deleteSolution(Solution solution){
        solutionRepository.delete(solution);
    }

    public void deleteSolutionById(int id) {
        solutionRepository.deleteById(id);
    }
}
