
// Progress.java
package com.student.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import jakarta.persistence.*;

@Entity
@Table(name = "avancement")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Progress {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @ManyToOne
    @JoinColumn(name = "id_etudiant", nullable = false)
    private Student student;
    
    @ManyToOne
    @JoinColumn(name = "id_semestre", nullable = false)
    private Semester semester;
    
    @ManyToOne
    @JoinColumn(name = "id_session", nullable = false)
    private Session session;
}
