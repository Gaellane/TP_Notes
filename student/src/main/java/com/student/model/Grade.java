// Grade.java
package com.student.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "note")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Grade {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @Column(name = "note")
    private Double grade;
    
    @ManyToOne
    @JoinColumn(name = "id_matiere", nullable = false)
    private Subject subject;
    
    @ManyToOne
    @JoinColumn(name = "id_avancement", nullable = false)
    private Progress progress;
    
    @Column(name = "date_entree", nullable = false)
    private LocalDate entryDate;
}