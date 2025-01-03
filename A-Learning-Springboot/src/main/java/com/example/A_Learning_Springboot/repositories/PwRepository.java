package com.example.A_Learning_Springboot.repositories;

import com.example.A_Learning_Springboot.entities.Course;
import com.example.A_Learning_Springboot.entities.Pw;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface PwRepository extends JpaRepository<Pw, Integer> {
    // Option 1: Find by Course entity
    List<Pw> findByCourse(Course course);

    // Option 2: Find by Course ID (if idCourse is the field name in Course entity)
    List<Pw> findByCourse_IdCourse(String courseId);
    @Query(value = "SELECT * FROM practicalworks WHERE pwid = :pwId", nativeQuery = true)
    Pw findByPwId(@Param("pwId") int pwId);


}
