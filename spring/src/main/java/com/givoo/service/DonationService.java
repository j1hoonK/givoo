package com.givoo.service;

import com.givoo.entity.donation.Donation;
import com.givoo.entity.donation.DonationType;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;
@Service
public interface DonationService {
    // 후원화면_후원타입
    List<DonationType> findByOrgIdFromDonation(Long orgId);

    //public String dntSend(Long orgId, Long userId, String dntType, Long dntAmount, String typePayment, String dntComment, Date dntDate, String isRegulation, String dntCommentRegulation);


    String dntSend(Long orgId, Long userId, String dntType, Long dntAmount, String typePayment, String dntComment, Date dntDate, String isRegulation, String dntCommentRegulation);

    // 후원전송
    Donation sendDonation(Donation donation);

    Optional<Donation> dnt(Long id);

    List<Donation> findByOrgId(Long id);
    List<Donation> findAll();

}
