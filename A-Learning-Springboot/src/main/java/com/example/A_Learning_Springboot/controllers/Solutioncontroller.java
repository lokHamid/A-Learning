package com.example.A_Learning_Springboot.controllers;


import com.example.A_Learning_Springboot.entities.Solution;
import com.example.A_Learning_Springboot.entities.files;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/solution")
public class Solutioncontroller {

    @GetMapping(value = "/getSolution", produces = "application/json")
    public Solution getSolution() {
        List<files> f = new ArrayList<>();
        files file1 = new files("Gl Ch5", "https://drive.google.com/file/d/1LRKcH7uU92f6EQsG72TzrS9BMCEBO-Ap/view?usp=drive_link",null);
        files file2 = new files("Gl Ch4", "https://drive.google.com/file/d/1EtAnmH1tvUDhqdl6UGgsyywxtQRQm6cy/view?usp=drive_link",null);
        files file3 = new files("Gl Td3", "https://drive.google.com/file/d/1F6Kiz7EuGV0fs2judAk2DQq7HDnxl3uy/view?usp=drive_link",null);
        files file4 = new files("Youtube", "https://youtu.be/sm4RQlJAreM?si=KzTai-oduXFkGq7l",null);

        f.add(file1);
        f.add(file2);
        f.add(file3);
        f.add(file4);

        return new Solution("", "Student Name", 123, f);
    }

}
