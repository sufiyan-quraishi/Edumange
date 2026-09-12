package com.edumanage.repository;

import com.edumanage.model.Batch;
import com.edumanage.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface BatchRepository extends JpaRepository<Batch, Long> {
    List<Batch> findByTrainer(User trainer);
    List<Batch> findByStudents_Id(Long studentId);
}