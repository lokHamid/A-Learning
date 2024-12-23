package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.Pw;
import org.springframework.stereotype.Service;
import com.example.A_Learning_Springboot.repositories.PwRepository;

import java.util.List;
import java.util.Optional;

@Service
public class PwService {

    private final PwRepository pwRepository;

    public PwService(PwRepository pwRepository) {
        this.pwRepository = pwRepository;
    }

    public List<Pw> getAllPws() {
        return pwRepository.findAll();
    }

    public Optional<Pw> getPwById(int id) {
        return pwRepository.findById(id);
    }

    public Pw savePw(Pw pw) {
        pwRepository.save(pw);
        return pw;
    }

    public Pw savePwById(int id, Pw pw) {
        Optional<Pw> pwOptional = pwRepository.findById(id);
        if (pwOptional.isPresent()) {
            Pw newPw = pwOptional.get();
            newPw.setPwId(pw.getPwId());
            newPw.setObjectives(pw.getObjectives());
            newPw.setMaterials(pw.getMaterials());
            newPw.setSteps(pw.getSteps());
            newPw.setRefCourse(pw.getRefCourse());
            pwRepository.save(newPw);
        }
        return null;
    }

    public void deletePw(Pw pw){
        pwRepository.delete(pw);
    }

    public void deletePwById(int id) {
        pwRepository.deleteById(id);
    }

}
