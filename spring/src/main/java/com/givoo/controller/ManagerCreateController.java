package com.givoo.controller;

import com.givoo.dto.ManagerCreateDTO;
import com.givoo.service.ManagerService;
import jakarta.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/manager")
public class ManagerCreateController {

    private final ManagerService managerService;

    @GetMapping("/signup")
    public String signup(ManagerCreateDTO managerCreateDTO) {
        return "signup_form";
    }

    @PostMapping("/signup")
    public String signup(@Valid ManagerCreateDTO managerCreateDTO, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "signup_form";
        }

        if (!managerCreateDTO.getPassword1().equals(managerCreateDTO.getPassword2())) {
            bindingResult.rejectValue("password2", "passwordInCorrect",
                    "패스워드가 일치하지 않습니다.");
            return "signup_form";
        }

        managerService.create(managerCreateDTO.getUsername(),
                managerCreateDTO.getPassword1());

        return "redirect:/";
    }
}
