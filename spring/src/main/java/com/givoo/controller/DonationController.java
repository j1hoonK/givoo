package com.givoo.controller;

import com.givoo.entity.donation.Donation;
import com.givoo.entity.donation.DonationType;
import com.givoo.service.DonationService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Tag(name = "Donation", description = "후원 관련 API")
@CrossOrigin(origins = "")
@RestController
@RequestMapping("/donation")
public class DonationController {

    private final DonationService donationService;

    @Autowired
    public DonationController(DonationService donationService) {
        this.donationService = donationService;
    }
    @GetMapping("/{orgid}")
    @Operation(summary = "후원 종류", description = "기관별 후원종류")
    public List<DonationType> findByOrgIdFromDonation(@PathVariable("orgid")Long orgid){
        return donationService.findByOrgIdFromDonation(orgid);
    }

    @PostMapping("/send")
    @Operation(summary = "후원하기", description = "후원하기_관련정보 DB로 전송")
    public Donation sendDonation(@RequestBody Donation donation){
        return donationService.sendDonation(donation);
    }

    
}
