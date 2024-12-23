package com.example.A_Learning_Springboot.services;

import com.example.A_Learning_Springboot.entities.Pw;
import org.springframework.stereotype.Service;
import com.example.A_Learning_Springboot.repositories.PwRepository;

import java.util.List;
import java.util.Optional;

@Service
public class PwService {
    //too lazy too .( zino hadi ak nta dirha w dir multiple reference ana 3yit ;-;)

    private final PwRepository pwRepository;

    public PwService(PwRepository pwRepository) {
        this.pwRepository = pwRepository;
    }

    public void deletePw(Pw pw){
        pwRepository.delete(pw);
    }

    public Pw savePw(Pw pw) {
        pwRepository.save(pw);
        return pw;
    }

    public List<Pw> getAllPws() {
        return pwRepository.findAll();
    }

    public Optional<Pw> getPwById(int id) {
        return pwRepository.findById(id);
    }


}
