package com.givoo.controller;

import com.givoo.entity.donation.Donation;
import com.givoo.entity.donation.DonationType;
import com.givoo.service.DonationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@CrossOrigin(origins = "")
@RestController
@RequestMapping("/donation")
public class DonationController {

    private final DonationService donationService;

    @Autowired
    public DonationController(DonationService donationService) {
        this.donationService = donationService;
    }
    @GetMapping("/{orgid}")     // 후원화면_후원 종류
    public List<DonationType> findByOrgIdFromDonation(@PathVariable("orgid")Long orgid){
        return donationService.findByOrgIdFromDonation(orgid);
    }

    @PostMapping("/send")       // 후원전송
    public Donation sendDonation(@RequestBody Donation donation){
        return donationService.sendDonation(donation);
    }
}
