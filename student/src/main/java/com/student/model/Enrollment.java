// Enrollment.java
package com.student.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "inscription")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Enrollment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @ManyToOne
    @JoinColumn(name = "id_etudiant", nullable = false)
    private Student student;
    
    @ManyToOne
    @JoinColumn(name = "id_annee_univeritaire", nullable = false)
    private AcademicYear academicYear;
    
    @ManyToOne
    @JoinColumn(name = "id_filiere_classe", nullable = false)
    private FieldClass fieldClass;
    
    @Column(name = "date_inscription", nullable = false)
    private LocalDate enrollmentDate;
}

