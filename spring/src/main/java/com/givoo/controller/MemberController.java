package com.givoo.controller;

import com.givoo.constant.Role;
import com.givoo.dto.MemberFormDTO;
import com.givoo.entity.Member;
import com.givoo.entity.donation.Donation;
import com.givoo.entity.organization.Organization;
import com.givoo.entity.organization.OrganizationNotice;
import com.givoo.service.*;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    @Autowired
    private final OrganizationNoticeService organizationNoticeService;
    @GetMapping("/login")
    public String loginMember(){
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
    @GetMapping("")
    public String join(){
        return "join";
    }

    @GetMapping("/joinCheck/{username}")
    public ResponseEntity<Map<String, Boolean>> checkUsername(@PathVariable String username) {
        // 아이디 중복 검사 로직을 userService를 통해 수행
        boolean isUsernameTaken = memberService.validateDuplicateMember(username);
        // 결과를 JSON 형식으로 응답
        Map<String, Boolean> response = new HashMap<>();
        response.put("isUsernameTaken", isUsernameTaken);

        return ResponseEntity.ok(response);
    }
    @PostMapping("join/org")
    public String orgJoin(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam("orgName") String orgName,
            @RequestParam("orgOwner") String orgOwner,
            @RequestParam("orgType") String orgType,
            @RequestParam("orgTell") String orgTell,
            @RequestParam("orgInfo") String orgInfo,
            @RequestParam("homepage") String homepage,
            @RequestParam("accountNumber") String accountNumber,
            @RequestParam("accountHolder") String accountHolder,
            @RequestParam("address") String address,
            @RequestParam("zip") String zip,
            @RequestParam("orgOwnnumber") String orgOwnnumber,
            @RequestParam("startedUp") String startedUp,
            @RequestParam("bankName") String bankName,
            @RequestParam(value = "donationsType[]",required = false) List<String> donationType,
            Model model) throws IOException {
        String startUp = startedUp.replace("-", "년 ").replace("-", "월 ") + "일";
        Member member = new Member();
        member.setUsername(username);
        member.setPassword(passwordEncoder.encode(password));
        member.setRole(Role.USER);
        memberService.saveMember(member);
        Organization org = new Organization();
        org.setUsername(username);
        org.setOrgName(orgName);
        org.setOrgOwner(orgOwner);
        org.setOrgType(orgType);
        org.setOrgTell(orgTell);
        org.setOrgInfo(orgInfo);
        org.setHompage(homepage);
        org.setAccountNumber(accountNumber);
        org.setAccountHolder(accountHolder);
        org.setOrgAddress(address);
        org.setZip(zip);
        org.setOrgOwner(orgOwnnumber);
        org.setStartedUp(startUp);
        org.setBankName(bankName);
        // org.setImagePath(imagePath);

        organizationService.save(org);

        // 여기에서 회원가입 처리 로직을 구현합니다.
        // 처리 결과에 따라 적절한 응답을 반환하거나 리다이렉트할 수 있습니다.
        return "redirect:/members/login"; // 회원가입 성공 시 로그인 페이지로 리다이렉트
    }


}