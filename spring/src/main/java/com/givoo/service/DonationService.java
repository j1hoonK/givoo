package com.givoo.service;

import com.givoo.dto.donation.DonationDTO;
import com.givoo.dto.donation.DonationRegulationDTO;
import com.givoo.dto.donation.DonationSendDTO;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public interface DonationService {
    public DonationDTO dnt(Long orgId,Long userId);
    public DonationRegulationDTO dntRegulation(Long userId);
    public DonationSendDTO dntSend(Long orgId, Long userId, String dntType, Long dntAmount, String typePayment, String dntComment, Date dntDate);

}
