package com.edumanage.service;

import com.edumanage.model.Registration;
import com.edumanage.model.User;
import com.edumanage.repository.RegistrationRepository;
import com.edumanage.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;

@Service
public class RegistrationService {

    @Autowired
    private RegistrationRepository registrationRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private EmailService emailService;   // ✅ EmailService inject किया

    public Registration save(Registration registration) {
        registration.setStatus(Registration.Status.PENDING);
        return registrationRepository.save(registration);
    }

    public List<Registration> findAll() {
        return registrationRepository.findAll();
    }

    public List<Registration> findPending() {
        return registrationRepository.findByStatus(Registration.Status.PENDING);
    }

    public Registration findById(Long id) {
        return registrationRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Registration not found: " + id));
    }

    public void reject(Long id) {
        Registration reg = findById(id);
        reg.setStatus(Registration.Status.REJECTED);
        registrationRepository.save(reg);
    }

    /**
     * Pending Approval -> Admin Approval -> Student Login Created
     * Generates a username/password for the student, creates their User account,
     * and sends credentials via email.
     */
    public String approveAndCreateLogin(Long registrationId) {
        Registration reg = findById(registrationId);

        if (reg.getStatus() == Registration.Status.APPROVED) {
            throw new RuntimeException("Registration already approved");
        }

        // Generate username from name + id, ensure uniqueness
        String baseUsername = reg.getFullName().toLowerCase().replaceAll("\\s+", ".");
        String username = baseUsername;
        int suffix = 1;
        while (userRepository.existsByUsername(username)) {
            username = baseUsername + suffix;
            suffix++;
        }

        // ✅ Random password generate
        String generatedPassword = generateRandomPassword();

        // ✅ Create User
        User student = new User();
        student.setUsername(username);
        student.setPassword(passwordEncoder.encode(generatedPassword));
        student.setFullName(reg.getFullName());
        student.setEmail(reg.getEmail());
        student.setPhone(reg.getPhone());
        student.setRole(User.Role.STUDENT);
        student.setActive(true);
        User savedStudent = userRepository.save(student);

        // ✅ Update Registration
        reg.setStatus(Registration.Status.APPROVED);
        reg.setGeneratedUserId(savedStudent.getId());
        registrationRepository.save(reg);

        // ✅ Send Email with credentials
        emailService.sendApprovalEmail(
                reg.getEmail(),
                reg.getFullName(),
                username,
                generatedPassword
        );

        // Return credentials (optional, for admin view)
        return username + " / " + generatedPassword;
    }

    private String generateRandomPassword() {
        String chars = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789";
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 8; i++) {
            sb.append(chars.charAt(random.nextInt(chars.length())));
        }
        return sb.toString();
    }
}
