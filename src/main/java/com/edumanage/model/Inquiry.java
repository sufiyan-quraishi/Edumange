package com.edumanage.model;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "inquiries")
public class Inquiry {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String phone;

    private String email;

    private String courseInterested;

    @Column(length = 1000)
    private String message;

    @Enumerated(EnumType.STRING)
    private Status status = Status.NEW; // NEW, FOLLOWED_UP, CONVERTED, CLOSED

    private LocalDateTime createdAt = LocalDateTime.now();

    public enum Status {
        NEW, FOLLOWED_UP, CONVERTED, CLOSED
    }

    // ---------- Getters and Setters ----------

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getCourseInterested() { return courseInterested; }
    public void setCourseInterested(String courseInterested) { this.courseInterested = courseInterested; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public Status getStatus() { return status; }
    public void setStatus(Status status) { this.status = status; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}
