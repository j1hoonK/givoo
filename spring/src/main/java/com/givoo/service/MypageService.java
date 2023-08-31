package com.givoo.service;

import com.givoo.dto.mypage.MyOrgDTO;
import com.givoo.entity.donation.Donation;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface MypageService {
    //public MyDonationDetailDTO myDntDetail(Long dntId);
    List<Donation> myDnt(Long userId);
    List<MyOrgDTO> myOrg(Long userId);
    Donation myDntDetail(Long dntId);

}
