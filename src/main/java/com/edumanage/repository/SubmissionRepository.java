package com.edumanage.repository;

import com.edumanage.model.Submission;
import com.edumanage.model.Task;
import com.edumanage.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface SubmissionRepository extends JpaRepository<Submission, Long> {
    List<Submission> findByTask(Task task);
    List<Submission> findByStudent(User student);
    List<Submission> findByTaskAndStudent(Task task, User student);
        void deleteByStudent(User student);
        void deleteByStudentId(Long studentId);
}