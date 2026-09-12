package com.edumanage.model;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "registrations")
public class Registration {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String fullName;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String phone;

    private String address;

    @Column(nullable = false)
    private String courseApplied;

    private String qualification;

    @Enumerated(EnumType.STRING)
    private Status status = Status.PENDING; // PENDING, APPROVED, REJECTED

    private LocalDateTime registeredAt = LocalDateTime.now();

    // Set once approved and a student User + login is generated
    private Long generatedUserId;

    public enum Status {
        PENDING, APPROVED, REJECTED
    }

    // ---------- Getters and Setters ----------

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getCourseApplied() { return courseApplied; }
    public void setCourseApplied(String courseApplied) { this.courseApplied = courseApplied; }

    public String getQualification() { return qualification; }
    public void setQualification(String qualification) { this.qualification = qualification; }

    public Status getStatus() { return status; }
    public void setStatus(Status status) { this.status = status; }

    public LocalDateTime getRegisteredAt() { return registeredAt; }
    public void setRegisteredAt(LocalDateTime registeredAt) { this.registeredAt = registeredAt; }

    public Long getGeneratedUserId() { return generatedUserId; }
    public void setGeneratedUserId(Long generatedUserId) { this.generatedUserId = generatedUserId; }
}
