package com.givoo.donation.Service;

import com.givoo.donation.Entity.DonationEntity;
import com.givoo.donation.Entity.DonationTypeEntity;
import com.givoo.donation.Repository.DonationRepository;
import com.givoo.donation.Repository.DonationTypeRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DonationService {
    private final DonationRepository donationRepository;
    private final DonationTypeRepository donationTypeRepository;

    public DonationService(DonationRepository donationRepository, DonationTypeRepository donationTypeRepository) {
        this.donationRepository = donationRepository;
        this.donationTypeRepository = donationTypeRepository;
    }

    // 후원 전송
    public DonationEntity sendDonation (DonationEntity donationEntity){
        return donationRepository.save(donationEntity);
    }

    // 후원 화면
    public List<DonationTypeEntity> findByOrgIdFromDonation(Long org_id){
        return donationTypeRepository.findByOrgId(org_id);
    }
}
