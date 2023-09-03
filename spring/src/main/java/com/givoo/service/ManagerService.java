package com.givoo.service;

import com.givoo.entity.Manager;
import com.givoo.repository.ManagerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.security.crypto.password.PasswordEncoder;

@RequiredArgsConstructor
@Service
public class ManagerService {

    private final ManagerRepository ManagerRepository;
    private final PasswordEncoder passwordEncoder;

    public Manager create(String username, String password) {
        Manager user = new Manager();
        user.setUsername(username);
        user.setPassword(passwordEncoder.encode(password));
        this.ManagerRepository.save(user);
        return user;
    }
}

