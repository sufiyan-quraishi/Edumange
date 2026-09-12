package com.edumanage.repository;

import com.edumanage.model.Attendance;
import com.edumanage.model.Batch;
import com.edumanage.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.time.LocalDate;
import java.util.List;

public interface AttendanceRepository extends JpaRepository<Attendance, Long> {
    List<Attendance> findByBatchAndAttendanceDate(Batch batch, LocalDate date);
    List<Attendance> findByStudent(User student);
    
    void deleteByStudent(User student);
}