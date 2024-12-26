package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.FileClass;
import com.example.A_Learning_Springboot.entities.Pw;
import com.example.A_Learning_Springboot.repositories.PwRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class PwService {

    private final PwRepository pwRepository;
    private final FileClassService fileClassService;

    @Autowired
    public PwService(PwRepository pwRepository, FileClassService fileClassService) {
        this.pwRepository = pwRepository;
        this.fileClassService = fileClassService;
    }

    public List<Pw> getAllPws() {
        return pwRepository.findAll();
    }

    public List<Pw> getPwById(String id) {
        List<Pw> pwList = pwRepository.findByCourse_IdCourse(id);

        System.out.println(pwList.size());
        if (!pwList.isEmpty()) {
            for(Pw pw : pwList) {
                List<FileClass> files = fileClassService.findByPwId(pw.getPwId());
                System.out.println( "list of files for pw " + pw.getPwname() + " :  \n" + files.size());
                pw.setFiles(files);
            }

            return pwList;
        }else{
            return null;
        }
    }

    @Transactional
    public Pw savePw(Pw pw) {
        // Save the Pw entity first
        Pw savedPw = pwRepository.save(pw);

        // Handle files and assignments separately, as per the requirements
        if (pw.getFiles() != null) {
            for (FileClass file : pw.getFiles()) {
                // Assign this file to the current Pw object
                file.setRef_pw(savedPw);
                fileClassService.save(file); // Save the file
            }
        }

        if (pw.getPw() != null) {
            for (FileClass assignmentFile : pw.getPw()) {
                // Assign this assignment file to the current Pw object
                assignmentFile.setRef_pw(savedPw);
                fileClassService.save(assignmentFile); // Save the assignment file
            }
        }

        return savedPw;
    }

    @Transactional
    public Pw savePwById(int id, Pw pw) {
        Optional<Pw> pwOptional = pwRepository.findById(id);
        if (pwOptional.isPresent()) {
            Pw existingPw = pwOptional.get();
            existingPw.setObjectives(pw.getObjectives());
            existingPw.setMaterials(pw.getMaterials());
            existingPw.setSteps(pw.getSteps());
            existingPw.setPwname(pw.getPwname());
            existingPw.setSubmissiondeadline(pw.getSubmissiondeadline());

            // Update the existing Pw entity and link files
            Pw updatedPw = pwRepository.save(existingPw);

            // Handle files
            if (pw.getFiles() != null) {
                for (FileClass file : pw.getFiles()) {
                    file.setRef_pw(updatedPw); // Link to updated Pw
                    fileClassService.save(file); // Save the file
                }
            }

            // Handle assignment files (if any)
            if (pw.getPw() != null) {
                for (FileClass assignmentFile : pw.getPw()) {
                    assignmentFile.setRef_pw(updatedPw); // Link to updated Pw
                    fileClassService.save(assignmentFile); // Save the assignment file
                }
            }

            return updatedPw;
        }
        return null;
    }

    public void deletePw(Pw pw) {
        pwRepository.delete(pw);
    }

    public void deletePwById(int id) {
        pwRepository.deleteById(id);
    }

}
