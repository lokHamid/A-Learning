package com.example.A_Learning_Springboot.entities;

import java.util.Date;
import java.util.List;

public class PWDTO {
    private Integer pw_id;
    private String pwname;
    private String steps;
    private String objectives;
    private String materials;
    private Date submissiondeadline;
   private String courseName;
   private List<FileDTO> files;

    public Integer getPw_id() {
        return pw_id;
    }

    public void setPw_id(Integer pw_id) {
        this.pw_id = pw_id;
    }

    public String getPwname() {
        return pwname;
    }

    public void setPwname(String pwname) {
        this.pwname = pwname;
    }

    public String getSteps() {
        return steps;
    }

    public void setSteps(String steps) {
        this.steps = steps;
    }

    public String getObjectives() {
        return objectives;
    }

    public void setObjectives(String objectives) {
        this.objectives = objectives;
    }

    public String getMaterials() {
        return materials;
    }

    public void setMaterials(String materials) {
        this.materials = materials;
    }

    public Date getSubmissiondeadline() {
        return submissiondeadline;
    }

    public void setSubmissiondeadline(Date submissiondeadline) {
        this.submissiondeadline = submissiondeadline;
    }

    public List<FileDTO> getFiles() {
        return files;
    }

    public void setFiles(List<FileDTO> files) {
        this.files = files;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
}
