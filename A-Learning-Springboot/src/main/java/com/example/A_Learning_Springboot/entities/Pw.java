package com.example.A_Learning_Springboot.entities;

import jakarta.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name="practicalworks")
public class Pw {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pwid")
    private int pw_id;
    private String objectives;
    private String materials;
    private String steps;
    private String pwname;
    @ManyToOne
    @JoinColumn(name = "course_id", referencedColumnName = "id_course")
    private String course_id;
    @Temporal(TemporalType.TIMESTAMP)
    private Date submissiondeadline;

    // List of files related to the practical work
    @OneToMany(mappedBy = "ref_pw", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<FileClass> files;

    // Additional files related to practical work
    @OneToMany(mappedBy = "ref_pw", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<FileClass> pw;

    public Pw() {}

    public int getPwId() {
        return pw_id;
    }

    public void setPwId(int pw_id) {
        this.pw_id = pw_id;
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

    public String getSteps() {
        return steps;
    }

    public void setSteps(String steps) {
        this.steps = steps;
    }

    public String getPwname() {
        return pwname;
    }

    public void setPwname(String pwname) {
        this.pwname = pwname;
    }

    public Date getSubmissiondeadline() {
        return submissiondeadline;
    }

    public void setSubmissiondeadline(Date submissiondeadline) {
        this.submissiondeadline = submissiondeadline;
    }

    public List<FileClass> getFiles() {
        return files;
    }

    public void setFiles(List<FileClass> files) {
        this.files = files;
    }

    public List<FileClass> getPw() {
        return pw;
    }

    public void setPw(List<FileClass> pw) {
        this.pw = pw;
    }

    public String getCourse_id() {
        return course_id;
    }

    public void setCourse_id(String course_id) {
        this.course_id = course_id;
    }
}
