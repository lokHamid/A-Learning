package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.FileClass;
import com.example.A_Learning_Springboot.entities.Pw;
import com.example.A_Learning_Springboot.entities.Solution;
import com.example.A_Learning_Springboot.repositories.SolutionRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class SolutionService {

    private final SolutionRepository solutionRepository;
    private final FileClassService fileClassService;
public long count_all(){
    return solutionRepository.count();}

    public SolutionService(SolutionRepository solutionRepository, FileClassService fileClassService) {
        this.solutionRepository = solutionRepository;
        this.fileClassService = fileClassService;
    }

    public List<Solution> getAllSolutions(){
        return solutionRepository.findAll();
    }
public Solution getSolutionByid_solution(int id){
       return solutionRepository.findById_solution(id);
}
    public List<Solution> getSolutionById(int id){
        List<Solution> solutions = solutionRepository.findByPwId(id);
        if(solutions != null){
            for(Solution solution : solutions){
                List<FileClass> files=fileClassService.findBySolutionId(solution.getId_solution());
                System.out.println("Fetched files: " + files);
                solution.setFiles(files);
            }
        }
        return solutions;
    }


    public Solution saveSolution(Solution solution) {
        // Step 1: Save the Solution first to get the id_solution
        Solution savedSolution = solutionRepository.save(solution);

        // Step 2: Handle files separately and link them to the saved solution
        if (solution.getFiles() != null) {
            for (FileClass file : solution.getFiles()) {
                file.setRef_solution(savedSolution);  // Link the file to the saved solution
                file.setIdSolution(savedSolution.getId_solution());  // Set the id_solution in the file
                fileClassService.save(file);  // Save the file
            }
        }
        return savedSolution;
    }

    public Solution saveSolutionById(int id, Solution solution) {
        Optional<Solution> solutionOptional = solutionRepository.findById(id);
        if(solutionOptional.isPresent()){
            Solution newSolution = solutionOptional.get();
            newSolution.setId_solution(solution.getId_solution());
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
