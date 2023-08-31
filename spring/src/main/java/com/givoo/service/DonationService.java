package com.givoo.service;

import com.givoo.dto.donation.DonationDTO;
import com.givoo.dto.mypage.DonationRegulationDTO;
import com.givoo.dto.donation.DonationSendDTO;
import com.givoo.entity.donation.Donation;
import com.givoo.entity.donation.DonationType;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public interface DonationService {
    public List<DonationType> dnt(Long orgId);

    DonationRegulationDTO dntRegulation(Long userId);

    public String dntSend(Long orgId, Long userId, String dntType, Long dntAmount, String typePayment, String dntComment, Date dntDate,String isRegulation,String dntCommentRegulation);

}
