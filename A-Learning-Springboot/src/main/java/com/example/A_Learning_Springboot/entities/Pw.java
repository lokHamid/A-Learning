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

    public Pw(String objectives, String materials, String steps, Course ref_course) {
        this.objectives = objectives;
        this.materials = materials;
        this.steps = steps;
        this.ref_course = ref_course;
    }
}
