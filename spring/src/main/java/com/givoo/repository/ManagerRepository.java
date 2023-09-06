package com.givoo.repository;

import com.givoo.entity.Manager;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ManagerRepository extends JpaRepository<Manager, Long> {
    Manager findByUsername(String username);
    }
