package com.givoo.controller;

import com.givoo.entity.Inquiry;
import com.givoo.entity.Users;
import com.givoo.entity.donation.Donation;
import com.givoo.entity.organization.Organization;
import com.givoo.entity.request.RequestEdit;
import com.givoo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class WebAdminController {
    private final InquiryService inquiryService;
    private final UsersService usersService;
    private final OrganizationService organizationService;
    private final DonationService donationService;
    private final RequestEditService requestEditService;
    @Autowired
    public WebAdminController(InquiryService inquiryService, UsersService usersService, OrganizationService organizationService, DonationService donationService, RequestEditService requestEditService) {
        this.inquiryService = inquiryService;
        this.usersService = usersService;
        this.organizationService = organizationService;
        this.donationService = donationService;
        this.requestEditService = requestEditService;
    }

    @GetMapping("/user/{page}")
    public String main(@PathVariable("page") int page, Model model) {
        List<Users> userList = usersService.findAll();
        int pageSize = 15;
        int totalUsers = userList.size();
        int totalPages = (int) Math.ceil((double) totalUsers / pageSize);
        // 페이지 번호를 받아올 수 있는 파라미터 (예: ?page=2)
        int currentPage = 1; // 기본 페이지 번호
        if (page > 0 && page <= totalPages) {
            currentPage = page;
        }

        int startIdx = (currentPage - 1) * pageSize;
        int endIdx = Math.min(currentPage * pageSize, totalUsers);

        // 현재 페이지에 해당하는 유저 리스트만 추출
        List<Users> currentPageUsers = userList.subList(startIdx, endIdx);

        model.addAttribute("totalPages", totalPages); // 전체 페이지 수를 모델에 추가
        model.addAttribute("currentPage", currentPage); // 현재 페이지 번호를 모델에 추가
        model.addAttribute("users", currentPageUsers); // 현재 페이지의 유저 리스트를 모델에 추가
        return "main_user";
    }

    @PutMapping("/user/{userId}/update")
    public String updateUser(@PathVariable Long userId, Users users,Model model) {
        Optional<Users> userOptional = usersService.findById(userId);
        Users updated = usersService.updateUser(userId, users);
        userOptional.ifPresent(user -> model.addAttribute("user", user));
        return "edit";
    }

    @DeleteMapping("/user/{userId}/delete")
    public String deleteUser(@PathVariable Long userId, Model model) {
        usersService.deleteUser(userId);
        return "delete";
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
    @GetMapping("/wdonation/{pages}")
    public String donation(@PathVariable("pages") int pages, Model model) {
        List<Donation> DonationList = donationService.findAll();
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

        model.addAttribute("totalPages", totalPages); // 전체 페이지 수를 모델에 추가
        model.addAttribute("currentPage", currentPage); // 현재 페이지 번호를 모델에 추가
        model.addAttribute("donation", currentPageDonation); // 현재 페이지의 유저 리스트를 모델에 추가
        return "donation";
    }
    @GetMapping("/request/org/{pages}")
    public String requestOrg(@PathVariable("pages") int pages, Model model) {
        List<Donation> DonationList = donationService.findAll();
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

        model.addAttribute("totalPages", totalPages); // 전체 페이지 수를 모델에 추가
        model.addAttribute("currentPage", currentPage); // 현재 페이지 번호를 모델에 추가
        model.addAttribute("donation", currentPageDonation); // 현재 페이지의 유저 리스트를 모델에 추가
        return "donation";
    }
    @GetMapping("/request/edit/{pages}")
    public String requestEdit(@PathVariable("pages") int pages, Model model) {
        List<RequestEdit> RequestEdit = requestEditService.findAll();
        int pageSize = 15;
        int totalEdit = RequestEdit.size();
        int totalPages = (int) Math.ceil((double) totalEdit / pageSize);
        // 페이지 번호를 받아올 수 있는 파라미터 (예: ?page=2)
        int currentPage = 1; // 기본 페이지 번호
        if (pages < totalEdit) {
            currentPage = pages;
        }
        int startIdx = (currentPage - 1) * pageSize;
        int endIdx = Math.min(currentPage * pageSize, totalEdit);
        // 현재 페이지에 해당하는 유저 리스트만 추출
        List<RequestEdit> currentPageRequestEdit = RequestEdit.subList(startIdx, endIdx);
        model.addAttribute("totalPages", totalPages); // 전체 페이지 수를 모델에 추가
        model.addAttribute("currentPage", currentPage); // 현재 페이지 번호를 모델에 추가
        model.addAttribute("edit", currentPageRequestEdit); // 현재 페이지의 유저 리스트를 모델에 추가
        return "admin_edit";
    }
    @GetMapping("/edit/ok/{id}")
    public String editOk(@PathVariable("id") Long id){
       Optional<RequestEdit> requestEdit = requestEditService.findById(id);
       Optional<Organization> org = organizationService.findById(requestEdit.get().getOrgId());
        org.ifPresent(org2 -> {
            org2.setHompage(requestEdit.get().getHompage());
            org2.setOrgInfo(requestEdit.get().getOrgInfo());
            org2.setAccountHolder(requestEdit.get().getAccountHolder());
            org2.setOrgName(requestEdit.get().getOrgName());
            org2.setAccountNumber(requestEdit.get().getAccountNumber());
            org2.setOrgOwner(requestEdit.get().getOrgOwner());
            org2.setOrgTell(requestEdit.get().getOrgTell());
            org2.setOrgType(requestEdit.get().getOrgType());
            org2.setBankName(requestEdit.get().getBankName());
            org2.setOrgAddress(requestEdit.get().getOrgAddress());
            org2.setStartedUp(requestEdit.get().getStartedUp());
            org2.setZip(requestEdit.get().getZip());
            organizationService.save(org2);
            requestEditService.deleteById(id);
        });
        return "admin_edit";
    }
    @GetMapping("/edit/no/{id}")
    public String editNo(@PathVariable("id") Long id) {
        requestEditService.deleteById(id);
        return "admin_edit";
    }

    @GetMapping("/inquiry/{pages}")
    public String inquiryList(@PathVariable("pages") int pages, Model model){
        List<Inquiry> inquiryList = inquiryService.findAll();
        int pageSize = 15;
        int totalInquriy = inquiryList.size();
        int totalPages = (int) Math.ceil((double) totalInquriy / pageSize);
        // 페이지 번호를 받아올 수 있는 파라미터 (예: ?page=2)
        int currentPage = 1; // 기본 페이지 번호
        if (pages < totalInquriy) {
            currentPage = pages;
        }
        int startIdx = (currentPage - 1) * pageSize;
        int endIdx = Math.min(currentPage * pageSize, totalInquriy);
        // 현재 페이지에 해당하는 유저 리스트만 추출
        List<Inquiry> currentPageinquiry = inquiryList.subList(startIdx, endIdx);
        model.addAttribute("totalPages", totalPages); // 전체 페이지 수를 모델에 추가
        model.addAttribute("currentPage", currentPage); // 현재 페이지 번호를 모델에 추가
        model.addAttribute("inquirys", currentPageinquiry); // 현재 페이지의 유저 리스트를 모델에 추가
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@");
        return "admin_inquiry";
    }
}
