package com.example.A_Learning_Springboot.entities;

import jakarta.persistence.*;

@Entity
@Table(name="files")
public class FileClass {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_file;
    private String url_file;
    //something here is missing!
    //implement multiple referencing logic here.
    //cuz the id_ref can reference either a solution or a pw itself.
    private int id_ref;
    public FileClass(){}

    public FileClass(String url_file, int id_ref) {
        this.url_file = url_file;
        this.id_ref = id_ref;
    }
    public int getId_file() {
        return id_file;
    }
    public void setId_file(int id_file) {
        this.id_file = id_file;
    }
    public String getUrl_file() {
        return url_file;
    }
    public void setUrl_file(String url_file) {
        this.url_file = url_file;
    }
}
