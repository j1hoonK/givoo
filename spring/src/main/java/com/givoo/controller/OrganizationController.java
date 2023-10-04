package com.givoo.controller;

import com.givoo.constant.Role;
import com.givoo.dto.organization.DetailOrgDTO;
import com.givoo.entity.Member;
import com.givoo.entity.organization.Organization;
import com.givoo.service.MemberService;
import com.givoo.service.OrganizationService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@Tag(name = "Organization", description = "기관 관련 API")
@RestController
public class OrganizationController {

    private final OrganizationService organizationService;
    private final MemberService memberService;

    @Autowired
    public OrganizationController(OrganizationService organizationService, MemberService memberService) {
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
    @PostMapping("org/join")
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
        member.setUsername("admin");
        member.setPassword("1234");
        member.setRole(Role.ADMIN);
        System.out.println(member);
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


}
