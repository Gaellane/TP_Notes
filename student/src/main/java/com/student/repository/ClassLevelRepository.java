// ClassLevelRepository.java
package com.student.repository;

import com.student.model.ClassLevel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClassLevelRepository extends JpaRepository<ClassLevel, Integer> {
}