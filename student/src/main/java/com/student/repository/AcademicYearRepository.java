// AcademicYearRepository.java
package com.student.repository;

import com.student.model.AcademicYear;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AcademicYearRepository extends JpaRepository<AcademicYear, Integer> {
}