package com.edumanage.repository;

import com.edumanage.model.Registration;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface RegistrationRepository extends JpaRepository<Registration, Long> {
    List<Registration> findByStatus(Registration.Status status);
}
