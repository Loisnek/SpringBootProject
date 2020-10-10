package com.SpringBootProject.OurApp.model;


import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Data
@NoArgsConstructor
@Table(name="specification_furniture")
@IdClass(Specification_furniture_Ids.class)
public class Specification_furniture implements Serializable {

    @Id
    @ManyToOne
    @JoinColumn(name = "product_type_id")
    private Product_types product_type;

    @Id
    @CollectionTable(name = "furniture_type", joinColumns = @JoinColumn(name = "furniture_article"))
    @Enumerated(EnumType.STRING)
    private Furniture_types furniture;

    @Column(nullable = false)
    private Long amount;

}
