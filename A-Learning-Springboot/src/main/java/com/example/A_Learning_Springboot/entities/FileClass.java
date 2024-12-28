package com.example.A_Learning_Springboot.entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;

@Entity
@Table(name = "files")
public class FileClass {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_file;
    private String filename;


    private String role;

    @Column(name = "url_file")
    private String url_file;

    @Column(name = "id_pw")  // Map to the correct column in your database
    private Integer idPw;
    @Column(name = "id_solution")
    private Integer idSolution;
    // Relationship to the Solution entity
    @ManyToOne
    @JsonBackReference
    @JoinColumn(name = "id_solution",referencedColumnName = "id_solution", insertable = false, updatable = false, foreignKey = @ForeignKey(name = "files_id_solution_fkey"))
    private Solution ref_solution;


    @ManyToOne
    @JoinColumn(name = "id_pw", referencedColumnName = "pwid", insertable = false, updatable = false, foreignKey = @ForeignKey(name = "files_id_pw_fkey"))
    @JsonBackReference // Prevent infinite recursion
    private Pw ref_pw;

    // Constructors, getters, and setters

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

    /*public int getIdPw() {
        return idPw;
    }
*/
    public void setIdPw(int idPw) {
        this.idPw = idPw;
    }

   /* public int getId_solution() {
        return ref_solution != null ? ref_solution.getId_solution() : null;}
*/

    public void setId_solution(int id_solution) {
        this.ref_solution.setId_solution(id_solution);
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }


    public Integer getIdSolution() {
        return idSolution;
    }

    public void setIdSolution(Integer idSolution) {
        this.idSolution = idSolution;
    }
}
