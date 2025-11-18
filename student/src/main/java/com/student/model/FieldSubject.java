// FieldSubject.java
package com.student.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import jakarta.persistence.*;

@Entity
@Table(name = "matiere_filiere")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FieldSubject {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @ManyToOne
    @JoinColumn(name = "id_bloc_matiere", nullable = false)
    private SubjectBlock subjectBlock;
    
    @ManyToOne
    @JoinColumn(name = "id_matiere", nullable = false)
    private Subject subject;
}