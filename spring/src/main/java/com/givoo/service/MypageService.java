package com.givoo.service;

import com.givoo.dto.donation.DonationSendDTO;
import com.givoo.dto.mypage.DonationRegulationDTO;
import com.givoo.dto.mypage.MyDonationDTO;
import com.givoo.dto.mypage.MyOrgDTO;
import com.givoo.entity.donation.Donation;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public interface MypageService {
    public Donation myDntDetail(Long dntId);
    public List<MyDonationDTO> myDnt(Long userId);
    public List<MyOrgDTO> myOrg(Long userId);
    public DonationRegulationDTO dntRegulation(Long userId);
}
