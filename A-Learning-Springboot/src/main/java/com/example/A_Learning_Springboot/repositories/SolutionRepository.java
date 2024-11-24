package com.example.A_Learning_Springboot.repositories;

import com.example.A_Learning_Springboot.entities.Solution;
import com.example.A_Learning_Springboot.entities.files;
import jakarta.annotation.PostConstruct;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class SolutionRepository {

    private List<Solution> solutions = new ArrayList<>();

    public void addSolution(Solution solution) {
        solutions.add(solution);
    }

    public List<Solution> getSolutions() {
        return solutions;
    }

    @PostConstruct
    public void init() {
        List<files> f1 = new ArrayList<>();
        f1.add(new files("File1", "https://example.com/file1", null));
        f1.add(new files("File2", "https://example.com/file2", null));

        List<files> f2 = new ArrayList<>();
        f2.add(new files("File3", "https://example.com/file3", null));
        f2.add(new files("File4", "https://example.com/file4", null));

        solutions.add(new Solution("Solution 1", "Student A", 101, f1));
        solutions.add(new Solution("Solution 2", "Student B", 102, f2));
    }
}