package com.givoo.service.serviceImp;

import com.givoo.dto.donation.DonationDTO;
import com.givoo.dto.donation.DonationRegulationDTO;
import com.givoo.dto.donation.DonationSendDTO;
import com.givoo.repository.donation.DonationRegularRepository;
import com.givoo.repository.donation.DonationRepository;
import com.givoo.service.DonationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class DonationServiceImpl implements DonationService {
    @Autowired
    DonationRepository donationRepository;
    @Autowired
    DonationRegularRepository donationRegularRepository;


    @Override
    public DonationDTO dnt(Long orgId,Long userId) {

        return null;
    }

    @Override
    public DonationRegulationDTO dntRegulation(Long userId) {
        return null;
    }
    @Override
    public DonationSendDTO dntSend(Long orgId, Long userId, String dntType, Long dntAmount, String typePayment, String dntComment, Date dntDate) {
        return null;
    }
}
