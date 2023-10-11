package com.givoo.controller;

import com.givoo.entity.donation.Donation;
import com.givoo.entity.organization.Organization;
import com.givoo.entity.organization.OrganizationNotice;
import com.givoo.service.DonationService;
import com.givoo.service.OrganizationNoticeService;
import com.givoo.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("auth")
public class PageController {

    private final OrganizationService organizationService;
    private final DonationService donationService;
    private final OrganizationNoticeService organizationNoticeService;

    @Autowired
    public PageController(OrganizationService organizationService, DonationService donationService, OrganizationNoticeService organizationNoticeService) {
        this.organizationService = organizationService;
        this.donationService = donationService;
        this.organizationNoticeService = organizationNoticeService;
    }

    @GetMapping("/org/dnt/{id}/{pages}")
    public String donation(@PathVariable("id") Long id, @PathVariable("pages") int pages, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        Optional<Organization> organization = organizationService.findById(id);
        List<Donation> DonationList = donationService.findByOrgId(id);
        if (organization == null) {
            // 기관을 찾을 수 없음. 에러 페이지 또는 리다이렉션 처리
            return "error";
        }
        if (username.equals(organization.get().getUsername())) {
            int pageSize = 15;
            int totalDonation = DonationList.size();
            int totalPages = (int) Math.ceil((double) totalDonation / pageSize);
            // 페이지 번호를 받아올 수 있는 파라미터 (예: ?page=2)
            int currentPage = 1; // 기본 페이지 번호
            if (pages < totalDonation) {
                currentPage = pages;
            }
            int startIdx = (currentPage - 1) * pageSize;
            int endIdx = Math.min(currentPage * pageSize, totalDonation);
            // 현재 페이지에 해당하는 유저 리스트만 추출
            List<Donation> currentPageDonation = DonationList.subList(startIdx, endIdx);
            model.addAttribute("organization", organization);
            model.addAttribute("totalPages", totalPages); // 전체 페이지 수를 모델에 추가
            model.addAttribute("currentPage", currentPage); // 현재 페이지 번호를 모델에 추가
            model.addAttribute("donation", currentPageDonation); // 현재 페이지의 유저 리스트를 모델에 추가
            return "org_dntlist";
        }
        return "error";
    }


    @GetMapping("/org/notice/{id}/{pages}")
    public String noticeList(@PathVariable("id") Long id, @PathVariable("pages") int pages, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        Optional<Organization> organization = organizationService.findById(id);
        List<OrganizationNotice> noticeList = organizationNoticeService.findByOrgId(id);
        if (organization == null) {
            // 기관을 찾을 수 없음. 에러 페이지 또는 리다이렉션 처리
            return "error";
        }
        if (username.equals(organization.get().getUsername())) {
            int pageSize = 15;
            int totalNotice = noticeList.size();
            int totalPages = (int) Math.ceil((double) totalNotice / pageSize);
            // 페이지 번호를 받아올 수 있는 파라미터 (예: ?page=2)
            int currentPage = 1; // 기본 페이지 번호
            if (pages < totalNotice) {
                currentPage = pages;
            }
            int startIdx = (currentPage - 1) * pageSize;
            int endIdx = Math.min(currentPage * pageSize, totalNotice);
            // 현재 페이지에 해당하는 유저 리스트만 추출
            List<OrganizationNotice> currentPageNtice = noticeList.subList(startIdx, endIdx);
            model.addAttribute("organization", organization);
            model.addAttribute("totalPages", totalPages); // 전체 페이지 수를 모델에 추가
            model.addAttribute("currentPage", currentPage); // 현재 페이지 번호를 모델에 추가
            model.addAttribute("notice", currentPageNtice); // 현재 페이지의 공지사항 리스트를 모델에 추가
            return "org_noticelist";
        }
        return "error";
    }
}