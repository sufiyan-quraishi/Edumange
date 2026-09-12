package com.edumanage.model;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "submissions")
public class Submission {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "task_id", nullable = false)
    private Task task;

    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private User student;

    private String fileName;   // stored file name on disk
    private String filePath;   // relative path

    @Column(length = 1000)
    private String submissionNote;

    private LocalDateTime submittedAt = LocalDateTime.now();

    // Trainer feedback
    private Integer marks;      // out of 100
    @Column(length = 1000)
    private String feedback;

    @Enumerated(EnumType.STRING)
    private Status status = Status.SUBMITTED; // SUBMITTED, REVIEWED

    public enum Status {
        SUBMITTED, REVIEWED
    }

    // ---------- Getters and Setters ----------

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Task getTask() { return task; }
    public void setTask(Task task) { this.task = task; }

    public User getStudent() { return student; }
    public void setStudent(User student) { this.student = student; }

    public String getFileName() { return fileName; }
    public void setFileName(String fileName) { this.fileName = fileName; }

    public String getFilePath() { return filePath; }
    public void setFilePath(String filePath) { this.filePath = filePath; }

    public String getSubmissionNote() { return submissionNote; }
    public void setSubmissionNote(String submissionNote) { this.submissionNote = submissionNote; }

    public LocalDateTime getSubmittedAt() { return submittedAt; }
    public void setSubmittedAt(LocalDateTime submittedAt) { this.submittedAt = submittedAt; }

    public Integer getMarks() { return marks; }
    public void setMarks(Integer marks) { this.marks = marks; }

    public String getFeedback() { return feedback; }
    public void setFeedback(String feedback) { this.feedback = feedback; }

    public Status getStatus() { return status; }
    public void setStatus(Status status) { this.status = status; }
}
