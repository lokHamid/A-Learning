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
        if (!pwList.isEmpty()) {
            for(Pw pw : pwList) {
                List<FileClass> files = fileClassService.findByPwId(pw.getPwId());
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

        // Handle files separately
        if (pw.getFiles() != null) {
            for (FileClass file : pw.getFiles()) {
                 file.setIdPw( savedPw.getPwId());
                file.setRef_pw(savedPw);
                fileClassService.save(file); // Save the file
            }
        }

        return savedPw;
    }
    public Pw getPwById(int id){
        return pwRepository.findByPwId(id);
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

            // Update the existing Pw entity
            Pw updatedPw = pwRepository.save(existingPw);

            // Handle files
            if (pw.getFiles() != null) {
                for (FileClass file : pw.getFiles()) {
                    file.setRef_pw(updatedPw); // Link to updated Pw
                    fileClassService.save(file); // Save the file
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
