package com.example.A_Learning_Springboot.entities;

public class FileDTO {
    private String filename;
    private String url_file;
    private String role;
    private Integer idPw;
    private Integer id_solution;
    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getUrl_file() {
        return url_file;
    }

    public void setUrl_file(String url_file) {
        this.url_file = url_file;
    }

    public Integer getIdPw() {
        return idPw;
    }

    public void setIdPw(Integer idPw) {
        this.idPw = idPw;
    }

    public Integer getId_solution() {
        return id_solution;
    }

    public void setId_solution(Integer id_solution) {
        this.id_solution = id_solution;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
