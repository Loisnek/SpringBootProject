package com.SpringBootProject.OurApp.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
@Table(name = "equipments")
public class Equipments {
    @Id
    private String mark;

    @OneToOne
    @JoinColumn(nullable = false)
    private Equipment_types equipment_type;

    @Column(nullable = true)
    private String description =null;

}
