package com.givoo.controller;

import com.givoo.constant.Role;
import com.givoo.dto.organization.DetailOrgDTO;
import com.givoo.entity.Member;
import com.givoo.entity.organization.Organization;
import com.givoo.service.MemberService;
import com.givoo.service.OrganizationService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Tag(name = "Organization", description = "기관 관련 API")
@RestController
public class OrganizationController {
    private final PasswordEncoder passwordEncoder;
    private final OrganizationService organizationService;
    private final MemberService memberService;

    @Autowired
    public OrganizationController(PasswordEncoder passwordEncoder, OrganizationService organizationService, MemberService memberService) {
        this.passwordEncoder = passwordEncoder;
        this.organizationService = organizationService;
        this.memberService = memberService;
    }


    @GetMapping("/info/{orgid}/{userid}")
    public DetailOrgDTO detailOrg(@PathVariable("orgid") Long orgid, @PathVariable("userid") Long userid){
        return organizationService.detailOrg(orgid,userid);
    }
    @GetMapping("/search/{orgname}")
    public List<Organization> searchOrg(@PathVariable("orgname") String orgname){
        return organizationService.searchOrg(orgname);
    }
    @GetMapping("/info/orgtype/{orgtype}")
    public List<Organization> orgType(@PathVariable("orgtype") String orgType){
        return organizationService.findType(orgType);
    }
    @GetMapping("/mainpage")
    public List<Organization> ranOrg(){
        return organizationService.randomOrg();

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
            //@RequestParam("bankName") String bankName,
            //@RequestParam("imagePath") String imagePath,
            Model model) {
        Organization org = new Organization();
        Member member = new Member();
        member.setUsername(username);
        member.setPassword(passwordEncoder.encode(password));
        member.setRole(Role.USER);
        memberService.saveMember(member);
        org.setOrgName(orgName);
        org.setOrgOwner(orgOwner);
        org.setOrgType(orgType);
        org.setOrgTell(orgTell);
        org.setOrgInfo(orgInfo);
        org.setHompage(homepage);
        org.setAccountNumber(accountNumber);
        org.setAccountHolder(accountHolder);
     //   org.setBankName(bankName);
       // org.setImagePath(imagePath);

        //organizationService.save(org);

        // 여기에서 회원가입 처리 로직을 구현합니다.
        // 처리 결과에 따라 적절한 응답을 반환하거나 리다이렉트할 수 있습니다.
        return "redirect:/login"; // 회원가입 성공 시 로그인 페이지로 리다이렉트
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
}
