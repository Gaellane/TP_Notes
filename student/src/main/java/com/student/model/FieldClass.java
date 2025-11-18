package com.student.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import jakarta.persistence.*;

@Entity
@Table(name = "filiere_classe")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FieldClass {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @ManyToOne
    @JoinColumn(name = "id_classe")
    private ClassLevel classLevel;
    
    @ManyToOne
    @JoinColumn(name = "id_filiere")
    private Field field;
}