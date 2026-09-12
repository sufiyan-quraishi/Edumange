package com.edumanage.repository;

import com.edumanage.model.Task;
import com.edumanage.model.Batch;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface TaskRepository extends JpaRepository<Task, Long> {
    List<Task> findByBatch(Batch batch);
}
