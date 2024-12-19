package com.example.A_Learning_Springboot.entities;

import jakarta.persistence.*;

@Entity
@Table(name="practicalworks")
public class Pw {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int pw_id;
    private String objectives;
    private String materials;
    private String steps;
    @ManyToOne
    @JoinColumn(name = "id_course", foreignKey = @ForeignKey(name = "practicalworks_id_course_fkey"))
    private Course ref_course;

    public Pw(){}

    public int getPw_id() {
        return pw_id;
    }
    public void setPw_id(int pw_id) {
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

    public Course getRef_course() {
        return ref_course;
    }
    public void setRef_course(Course ref_course) {
        this.ref_course = ref_course;
    }
}
