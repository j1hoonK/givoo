package com.givoo.controller;

import com.givoo.entity.donation.Donation;
import com.givoo.service.DonationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class WebDonationController {

    @Autowired
    private final DonationService donationService;

    public WebDonationController(DonationService donationService) {
        this.donationService = donationService;
    }


    @GetMapping("/wdonation/{pages}")
    public String donation(@PathVariable("pages") int pages, Model model) {
        List<Donation> DonationList = donationService.findAll();
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
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
}