package com.givoo.controller;

import com.givoo.entity.organization.Organization;
import com.givoo.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller

public class WebOrgController {

    @Autowired
    private final OrganizationService organizationService;

    public WebOrgController(OrganizationService organizationService) {
        this.organizationService = organizationService;
    }


    @GetMapping("/org/{pages}")
    public String org(@PathVariable("pages") int pages, Model model) {
        List<Organization> orgList = organizationService.findAll();
        int pageSize = 15;
        int totalOrgs = orgList.size();
        int totalPages = (int) Math.ceil((double) totalOrgs / pageSize);
        // 페이지 번호를 받아올 수 있는 파라미터 (예: ?page=2)
        int currentPage = 1; // 기본 페이지 번호
        if (pages < totalOrgs) {
            currentPage = pages;
        }

        int startIdx = (currentPage - 1) * pageSize;
        int endIdx = Math.min(currentPage * pageSize, totalOrgs);

        // 현재 페이지에 해당하는 유저 리스트만 추출
        List<Organization> currentPageOrgs = orgList.subList(startIdx, endIdx);

        model.addAttribute("totalPages", totalPages); // 전체 페이지 수를 모델에 추가
        model.addAttribute("currentPage", currentPage); // 현재 페이지 번호를 모델에 추가
        model.addAttribute("organizarion", currentPageOrgs); // 현재 페이지의 유저 리스트를 모델에 추가
        return "organization";
    }
    @GetMapping("/org/{id}/edit")
    public String orgEdit(@PathVariable("id") Long id, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        Optional<Organization> organization = organizationService.findById(id);
        if (organization == null) {
            // 기관을 찾을 수 없음. 에러 페이지 또는 리다이렉션 처리
            return "error";
        }
        model.addAttribute("org", organization);
            return "org_edit";
    }

    @PostMapping("org/edit/{orgid}")
    public String editOrg(@PathVariable("orgid") Long orgId,
                          @RequestParam("orgName") String orgName,
                          @RequestParam("orgOwner") String orgOwner,
                          @RequestParam("orgType") String orgType,
                          @RequestParam("orgTell") String orgTell,
                          @RequestParam("orgInfo") String orgInfo,
                          @RequestParam("homepage") String homepage,
                          @RequestParam("accountNumber") String accountNumber,
                          @RequestParam("accountHolder") String accountHolder){

        Optional<Organization> orgOptional = organizationService.findById(orgId);
        orgOptional.ifPresent(org -> {
            // 값이 있는 경우에만 이 블록이 실행됨
            Organization org2 = orgOptional.get();
            org2.setOrgName(orgName);
            org2.setOrgOwner(orgOwner);
            org2.setOrgType(orgType);
            org2.setOrgTell(orgTell);
            org2.setOrgInfo(orgInfo);
            org2.setHompage(homepage);
            org2.setAccountNumber(accountNumber);
            org2.setAccountHolder(accountHolder);

            organizationService.save(org2);
            System.out.println("zzzzzzsdf");
            // 이제 'org' 변수에 Organization 객체가 들어있습니다.
            // 여기서 'org'를 사용할 수 있습니다.
        });
        return "redirect:/org/1";
    }

}
