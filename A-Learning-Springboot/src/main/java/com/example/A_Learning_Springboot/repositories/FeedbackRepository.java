package com.example.A_Learning_Springboot.repositories;

import com.example.A_Learning_Springboot.entities.Feedback;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FeedbackRepository extends JpaRepository<Feedback, Integer> {

    @Query("SELECT DISTINCT s.ref_feedback FROM Solution s WHERE s.ref_student.id_user =:userId AND s.ref_pw.pw_id =:pwId")
    List<Feedback> findFeedbackByUserPwId(@Param("pwId") int pwId, @Param("userId") int userId);
}
