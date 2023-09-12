package com.givoo.controller;

import com.givoo.dto.mypage.MyDonationDetailDTO;
import com.givoo.entity.donation.Donation;
import com.givoo.entity.organization.Organization;
import com.givoo.service.MypageService;
import com.givoo.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class HomeController {

    private final OrganizationService organizationService;
    @Autowired
    public HomeController(OrganizationService organizationService, MypageService mypageService) {
        this.organizationService = organizationService;
    }

    @GetMapping("/org")
    public List<Organization> findAll() {
        return organizationService.findAll();
    }
}
