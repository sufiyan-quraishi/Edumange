package com.edumanage.service;

import com.edumanage.model.*;
import com.edumanage.repository.*;
import com.edumanage.util.FileUploadUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class StudentService {

    @Autowired
    private BatchRepository batchRepository;

    @Autowired
    private AttendanceRepository attendanceRepository;

    @Autowired
    private TaskRepository taskRepository;

    @Autowired
    private SubmissionRepository submissionRepository;

    // ---------- Assignment Submission ----------
    public Submission submitAssignment(Task task, User student, MultipartFile file, String note) throws IOException {
        Submission submission = new Submission();
        submission.setTask(task);
        submission.setStudent(student);
        submission.setSubmissionNote(note);

        if (file != null && !file.isEmpty()) {
            // Save file using utility
            String storedFileName = FileUploadUtil.saveFile(file.getOriginalFilename(), file);
            String filePath = FileUploadUtil.getUploadDir() + "/" + storedFileName;

            submission.setFileName(file.getOriginalFilename());
            submission.setFilePath(filePath);
        }

        return submissionRepository.save(submission);
    }

    // ---------- Batch & Attendance ----------
    public List<Batch> findBatchesForStudent(User student) {
        return batchRepository.findAll().stream()
                .filter(b -> b.getStudents().contains(student))
                .collect(java.util.stream.Collectors.toList());
    }

    public List<Attendance> findAttendanceForStudent(User student) {
        return attendanceRepository.findByStudent(student);
    }

    // ---------- Tasks ----------
    public List<Task> findTasksForBatch(Batch batch) {
        return taskRepository.findByBatch(batch);
    }

    public List<Task> findTasksForStudent(User student) {
        return findBatchesForStudent(student).stream()
                .flatMap(b -> taskRepository.findByBatch(b).stream())
                .collect(java.util.stream.Collectors.toList());
    }

    public Task findTaskById(Long id) {
        return taskRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Task not found: " + id));
    }

    public boolean hasSubmitted(Task task, User student) {
        return !submissionRepository.findByTaskAndStudent(task, student).isEmpty();
    }

    public List<Submission> findSubmissionsForStudent(User student) {
        return submissionRepository.findByStudent(student);
    }

    // ---------- Attendance Summary ----------
    public int[] attendanceSummary(User student) {
        List<Attendance> all = findAttendanceForStudent(student);
        long present = all.stream().filter(a -> a.getStatus() == Attendance.Status.PRESENT).count();
        return new int[]{(int) present, all.size()};
    }
}
