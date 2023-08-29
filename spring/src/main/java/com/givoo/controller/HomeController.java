package com.givoo.controller;

import com.givoo.dto.mypage.MyDonationDetailDTO;
import com.givoo.entity.organization.Organization;
import com.givoo.service.MypageService;
import com.givoo.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class HomeController {

    final OrganizationService organizationService;

    @Autowired
    public HomeController(OrganizationService organizationService) {
        this.organizationService = organizationService;
    }
    @Autowired
     MypageService mypageService;


    @GetMapping("/org")
    public List<Organization> findAll(Model model) {
        return organizationService.findAll();
    }

    @GetMapping("/mypage/dntresult/{userid}/{dntid}")
    public MyDonationDetailDTO myDonationDetail(@PathVariable("dntid") Long id){
        return mypageService.myDntDetail(id);
    }

}
