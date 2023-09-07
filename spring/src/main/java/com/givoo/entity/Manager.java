package com.givoo.entity;

import com.givoo.dto.ManagerCreateDTO;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.security .crypto.password.PasswordEncoder;

@Entity
@Getter
@Setter
@ToString
public class Manager {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String password;

    public static Manager createManager (ManagerCreateDTO managerCreateDTO, PasswordEncoder passwordEncoder){

        Manager manager = new Manager();
        String password = passwordEncoder.encode(managerCreateDTO.getPassword());
        manager.setPassword(password);
        return manager;
    }

}

