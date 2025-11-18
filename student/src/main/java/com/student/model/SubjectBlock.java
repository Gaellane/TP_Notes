
// SubjectBlock.java
package com.student.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import jakarta.persistence.*;

@Entity
@Table(name = "matiere_bloc")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SubjectBlock {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @Column(name = "credit", nullable = false)
    private Integer credit;
    
    @ManyToOne
    @JoinColumn(name = "id_filiere_classe", nullable = false)
    private FieldClass fieldClass;
    
    @ManyToOne
    @JoinColumn(name = "id_option", nullable = false)
    private Option option;
}
