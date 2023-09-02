package com.givoo.controller;

import com.givoo.entity.donation.Donation;
import com.givoo.entity.donation.DonationType;
import com.givoo.service.DonationService;
import com.givoo.service.OrganizationService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class DonationController {

    private final DonationService donationService;

    @Autowired
    public DonationController(DonationService donationService) {
        this.donationService = donationService;
    }
    @GetMapping("/donation/{orgid}")
    public List<DonationType> dntType(@PathVariable("orgid")Long orgid){
        return donationService.dnt(orgid);
    }


}
