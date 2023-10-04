package com.givoo.controller;

import com.givoo.constant.Role;
import com.givoo.dto.MemberFormDTO;
import com.givoo.entity.Member;
import com.givoo.service.MemberService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/members")
public class MemberController {
    @Autowired
    private final PasswordEncoder passwordEncoder;
    @Autowired
    private final MemberService memberService;

    @GetMapping("/login")
    public String loginMember(){
        System.out.println("dsfdfs");
        return "login";
    }

    @GetMapping("/login/error")
    public String loginError(Model model){
        model.addAttribute("loginErrorMsg","아이디 또는 비밀번호를 확인해주세요");
        return "login";
    }
    @PostMapping("")
    public String create(Member member) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        member.setPassword(passwordEncoder.encode(member.getPassword()));
        member.setRole(Role.valueOf("User"));
        memberService.saveMember(member);
        return "redirect:/";
    }
}