package com.student.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import jakarta.persistence.*;

@Entity
@Table(name = "etudiant")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @Column(name = "etu", unique = true)
    private String studentCode;
    
    @Column(name = "nom", nullable = false)
    private String lastName;
    
    @Column(name = "prenom")
    private String firstName;
    
    @Column(name = "adresse")
    private String address;
}