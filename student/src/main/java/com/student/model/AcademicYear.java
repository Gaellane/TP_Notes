// AcademicYear.java
package com.student.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "annee_universitaire")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AcademicYear {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @Column(name = "date_debut", nullable = false)
    private LocalDate startDate;
    
    @Column(name = "date_fin", nullable = false)
    private LocalDate endDate;
}