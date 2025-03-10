package com.example.A_Learning_Springboot.repositories;

import com.example.A_Learning_Springboot.entities.Pw;
import com.example.A_Learning_Springboot.entities.Solution;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.awt.print.Pageable;
import java.util.List;

public interface SolutionRepository extends JpaRepository<Solution , Integer> {


    @Query("SELECT s FROM Solution s WHERE s.ref_pw.pw_id = :pwId")
    List<Solution> findByPwId(@Param("pwId") int pwId);
    @Query(value = "SELECT * FROM solutions WHERE id_solution = :id_solution", nativeQuery = true)
    Solution findById_solution(@Param("id_solution") int id_solution);
long count();
}
