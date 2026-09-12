package com.edumanage.model;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;
import org.springframework.format.annotation.DateTimeFormat; // ✅ नया import

@Entity
@Table(name = "batches")
public class Batch {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String batchName; // e.g. "Java Full Stack - Morning - Jul2026"

    @Column(nullable = false)
    private String courseName;

    @DateTimeFormat(pattern = "yyyy-MM-dd")   
    private LocalDate startDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")  
    private LocalDate endDate;

    // Trainer assigned to this batch
    @ManyToOne
    @JoinColumn(name = "trainer_id")
    private User trainer;

    // Students assigned to this batch
    @ManyToMany
    @JoinTable(
        name = "batch_students",
        joinColumns = @JoinColumn(name = "batch_id"),
        inverseJoinColumns = @JoinColumn(name = "student_id")
    )
    private Set<User> students = new HashSet<>();

    private boolean active = true;

    // ---------- Getters and Setters ----------

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getBatchName() { return batchName; }
    public void setBatchName(String batchName) { this.batchName = batchName; }

    public String getCourseName() { return courseName; }
    public void setCourseName(String courseName) { this.courseName = courseName; }

    public LocalDate getStartDate() { return startDate; }
    public void setStartDate(LocalDate startDate) { this.startDate = startDate; }

    public LocalDate getEndDate() { return endDate; }
    public void setEndDate(LocalDate endDate) { this.endDate = endDate; }

    public User getTrainer() { return trainer; }
    public void setTrainer(User trainer) { this.trainer = trainer; }

    public Set<User> getStudents() { return students; }
    public void setStudents(Set<User> students) { this.students = students; }

    public boolean isActive() { return active; }
    public void setActive(boolean active) { this.active = active; }
}
