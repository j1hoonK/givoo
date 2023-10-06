package com.givoo.controller;

import com.givoo.constant.Role;
import com.givoo.dto.MemberFormDTO;
import com.givoo.entity.Member;
import com.givoo.entity.donation.Donation;
import com.givoo.entity.organization.Organization;
import com.givoo.service.DonationService;
import com.givoo.service.MemberService;
import com.givoo.service.OrganizationService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/members")
public class MemberController {
    @Autowired
    private final PasswordEncoder passwordEncoder;
    @Autowired
    private final MemberService memberService;
    @Autowired
    private final OrganizationService organizationService;
    @Autowired
    private final DonationService donationService;

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
    @GetMapping("/org/{id}")
    public String viewOrganization(@PathVariable("id") Long id, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        Optional<Organization> organization = organizationService.findById(id);
        if (organization == null) {
            // 기관을 찾을 수 없음. 에러 페이지 또는 리다이렉션 처리
            return "error";
        }
        if(username.equals(organization.get().getUsername())) {
            List<Donation> donations = donationService.findByOrgId(id);
            model.addAttribute("organization", organization);
            System.out.println("organization : " + organization.get().getOrgName());
            model.addAttribute("donations", donations);
            return "org_main2";
        }
        return "error";
    }

}