package com.edumanage.repository;

import com.edumanage.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    // Login
    Optional<User> findByUsername(String username);

    // Username check
    boolean existsByUsername(String username);

    // Trainer / Student List
    List<User> findByRole(User.Role role);

    // Active Users
    List<User> findByRoleAndActive(User.Role role, boolean active);

}

