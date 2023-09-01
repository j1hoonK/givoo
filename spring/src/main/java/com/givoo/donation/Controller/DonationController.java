package com.givoo.donation.Controller;

import com.givoo.donation.Entity.DonationEntity;
import com.givoo.donation.Entity.DonationTypeEntity;
import com.givoo.donation.Service.DonationService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name="test", description = "testtest")
@RestController
@RequestMapping("/donation")
public class DonationController {
    private final DonationService donationService;

    public DonationController(DonationService donationService) {
        this.donationService = donationService;
    }

    @PostMapping("/send")       // 후원 전송
    public DonationEntity sendDonation(@RequestBody DonationEntity donationEntity){
        return donationService.sendDonation(donationEntity);
    }

    @GetMapping("/{org_id}")     // 후원 화면
    public List<DonationTypeEntity> findByOrgId(Long org_id){
        return donationService.findByOrgIdFromDonation(org_id);
    }
}