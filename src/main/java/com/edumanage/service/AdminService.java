package com.edumanage.service;

import com.edumanage.model.Batch;
import com.edumanage.model.User;
import com.edumanage.model.Task;
import com.edumanage.repository.AttendanceRepository;
import com.edumanage.repository.BatchRepository;
import com.edumanage.repository.SubmissionRepository;
import com.edumanage.repository.TaskRepository;
import com.edumanage.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

@Service
public class AdminService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BatchRepository batchRepository;
    
    @Autowired(required = false)
    private SubmissionRepository submissionRepository;

    @Autowired(required = false)
    private AttendanceRepository attendanceRepository; // ✅ Required to clean attendance records

    @Autowired(required = false)
    private TaskRepository taskRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;
    // TRAINER CRUD
    public User createTrainer(String fullName, String email, String phone,
                              String username, String rawPassword) {

        if (userRepository.existsByUsername(username)) {
            throw new RuntimeException("Username already exists : " + username);
        }

        User trainer = new User();
        trainer.setFullName(fullName);
        trainer.setEmail(email);
        trainer.setPhone(phone);
        trainer.setUsername(username);
        trainer.setPassword(passwordEncoder.encode(rawPassword));
        trainer.setRole(User.Role.TRAINER);
        trainer.setActive(true);

        return userRepository.save(trainer);
    }

    public List<User> listTrainers() {
        return userRepository.findByRole(User.Role.TRAINER);
    }

    public User findTrainerById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() ->
                        new RuntimeException("Trainer not found : " + id));
    }

    public User updateTrainer(User trainer) {

        User existingTrainer = findTrainerById(trainer.getId());

        existingTrainer.setFullName(trainer.getFullName());
        existingTrainer.setEmail(trainer.getEmail());
        existingTrainer.setPhone(trainer.getPhone());
        existingTrainer.setUsername(trainer.getUsername());

        if (trainer.getPassword() != null &&
                !trainer.getPassword().trim().isEmpty()) {

            existingTrainer.setPassword(
                    passwordEncoder.encode(trainer.getPassword()));
        }

        existingTrainer.setActive(trainer.isActive());

        return userRepository.save(existingTrainer);
    }

    @Transactional
    public void deleteTrainer(Long id) {

        User trainer = findTrainerById(id);

        // 1. Unlink trainer from batches
        List<Batch> batches = batchRepository.findAll();
        for (Batch batch : batches) {
            if (batch.getTrainer() != null && batch.getTrainer().getId().equals(id)) {
                batch.setTrainer(null);
                batchRepository.save(batch);
            }
        }

        // 2. Remove tasks created by trainer
        if (taskRepository != null) {
            List<Task> tasks = taskRepository.findAll();
            for (Task task : tasks) {
                if (task.getTrainer() != null && task.getTrainer().getId().equals(id)) {
                    taskRepository.delete(task);
                }
            }
        }

        userRepository.delete(trainer);
    }
    // STUDENT CRUD
    public List<User> listStudents() {
        return userRepository.findByRole(User.Role.STUDENT);
    }

    public User findStudentById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() ->
                        new RuntimeException("Student not found : " + id));
    }

    public User updateStudent(User student) {

        User existingStudent = findStudentById(student.getId());

        existingStudent.setFullName(student.getFullName());
        existingStudent.setEmail(student.getEmail());
        existingStudent.setPhone(student.getPhone());
        existingStudent.setUsername(student.getUsername());

        if (student.getPassword() != null &&
                !student.getPassword().trim().isEmpty()) {

            existingStudent.setPassword(
                    passwordEncoder.encode(student.getPassword()));
        }

        existingStudent.setActive(student.isActive());

        return userRepository.save(existingStudent);
    }

    // ✅ FIXED: Unlink Batches, Attendance, and Submissions before deleting Student
    @Transactional
    public void deleteStudent(Long id) {

        User student = findStudentById(id);

        // 1. Remove student from all batches
        List<Batch> batches = batchRepository.findByStudents_Id(id);
        for (Batch batch : batches) {
            batch.getStudents().remove(student);
        }
        batchRepository.saveAll(batches);

        // 2. Remove attendance records for this student if repository exists
        if (attendanceRepository != null) {
            attendanceRepository.deleteByStudent(student);
        }

        // 3. Remove submission records for this student if repository exists
        if (submissionRepository != null) {
            submissionRepository.deleteByStudent(student);
        }

        // 4. Safely delete student user
        userRepository.delete(student);
    }
    // BATCH MANAGEMENT
    public Batch createBatch(Batch batch) {
        return batchRepository.save(batch);
    }

    public List<Batch> listBatches() {
        return batchRepository.findAll();
    }

    public Batch findBatchById(Long id) {
        return batchRepository.findById(id)
                .orElseThrow(() ->
                        new RuntimeException("Batch not found : " + id));
    }

    public Batch assignTrainer(Long batchId, Long trainerId) {

        Batch batch = findBatchById(batchId);

        User trainer = findTrainerById(trainerId);

        batch.setTrainer(trainer);

        return batchRepository.save(batch);
    }

    public Batch assignStudents(Long batchId, List<Long> studentIds) {

        Batch batch = findBatchById(batchId);

        Set<User> students =
                new HashSet<>(userRepository.findAllById(studentIds));

        batch.getStudents().clear();
        batch.getStudents().addAll(students);

        return batchRepository.save(batch);
    }

}