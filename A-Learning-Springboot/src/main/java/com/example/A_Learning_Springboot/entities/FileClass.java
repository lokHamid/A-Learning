package com.example.A_Learning_Springboot.entities;

import jakarta.persistence.*;

@Entity
@Table(name="files")
public class FileClass {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_file;
    private String filename;
    @Column(name = "role")
    private String role;
    @Column(name = "url_file")
    private String url_file;
    @ManyToOne
    @JoinColumn(name = "id_solution", foreignKey = @ForeignKey(name = "files_id_solution_fkey"))
    private Solution ref_solution;  // Link the file to the solution

    // Relationship to the Pw entity, representing the practical work
    @ManyToOne
    @JoinColumn(name = "id_pw", foreignKey = @ForeignKey(name = "files_id_pw_fkey"))
    private Pw ref_pw;  // Link the file to the practical work (Pw)

    public FileClass() {}

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

    public Solution getRef_solution() {
        return ref_solution;
    }

    public void setRef_solution(Solution ref_solution) {
        this.ref_solution = ref_solution;
    }

    public Pw getRef_pw() {
        return ref_pw;
    }

    public void setRef_pw(Pw ref_pw) {
        this.ref_pw = ref_pw;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
}
