package com.edumanage.service;

import com.edumanage.model.*;
import com.edumanage.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class TrainerService {

    @Autowired
    private BatchRepository batchRepository;

    @Autowired
    private AttendanceRepository attendanceRepository;

    @Autowired
    private TaskRepository taskRepository;

    @Autowired
    private SubmissionRepository submissionRepository;

    public List<Batch> findBatchesByTrainer(User trainer) {
        return batchRepository.findByTrainer(trainer);
    }

    public Batch findBatchById(Long id) {
        return batchRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Batch not found: " + id));
    }

    /** All students across every batch assigned to this trainer, de-duplicated. */
    public List<User> findAllStudentsForTrainer(User trainer) {
        Set<User> students = new LinkedHashSet<>();
        for (Batch b : findBatchesByTrainer(trainer)) {
            students.addAll(b.getStudents());
        }
        return new ArrayList<>(students);
    }

    /** All tasks the trainer has assigned, across every one of their batches. */
    public List<Task> findAllTasksForTrainer(User trainer) {
        List<Task> tasks = new ArrayList<>();
        for (Batch b : findBatchesByTrainer(trainer)) {
            tasks.addAll(taskRepository.findByBatch(b));
        }
        return tasks;
    }

    public Task findTaskById(Long id) {
        return taskRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Task not found: " + id));
    }

    /** Count of submissions across the trainer's tasks still awaiting review. */
    public long countPendingSubmissions(User trainer) {
        return findAllTasksForTrainer(trainer).stream()
                .flatMap(t -> submissionRepository.findByTask(t).stream())
                .filter(s -> s.getStatus() == Submission.Status.SUBMITTED)
                .count();
    }

    /**
     * Mark attendance for a whole batch on a given date.
     * statusMap: studentId -> "PRESENT"/"ABSENT"/"LATE"
     */
    public void markAttendance(Batch batch, LocalDate date, Map<Long, String> statusMap) {
        for (User student : batch.getStudents()) {
            String statusStr = statusMap.get(student.getId());
            if (statusStr == null) continue;

            Attendance attendance = new Attendance();
            attendance.setStudent(student);
            attendance.setBatch(batch);
            attendance.setAttendanceDate(date);
            attendance.setStatus(Attendance.Status.valueOf(statusStr));
            attendanceRepository.save(attendance);
        }
    }

    public Task assignTask(Task task) {
        return taskRepository.save(task);
    }

    public List<Task> findTasksByBatch(Batch batch) {
        return taskRepository.findByBatch(batch);
    }

    public List<Submission> findSubmissionsByTask(Task task) {
        return submissionRepository.findByTask(task);
    }

    /**
     * Trainer gives marks/feedback -> Submission.status = REVIEWED
     */
    public Submission giveFeedback(Long submissionId, Integer marks, String feedback) {
        Submission submission = submissionRepository.findById(submissionId)
                .orElseThrow(() -> new RuntimeException("Submission not found: " + submissionId));
        submission.setMarks(marks);
        submission.setFeedback(feedback);
        submission.setStatus(Submission.Status.REVIEWED);
        return submissionRepository.save(submission);
    }
}
