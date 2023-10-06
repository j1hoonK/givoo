package com.givoo.controller;

import com.givoo.entity.organization.Organization;
import com.givoo.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

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
}
