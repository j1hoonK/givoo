package com.givoo.service;

import com.givoo.dto.mypage.MyDonationDTO;
import com.givoo.dto.mypage.MyDonationDetailDTO;
import com.givoo.dto.mypage.MyOrgDTO;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface MypageService {
    public MyDonationDetailDTO myDntDetail(Long dntId);
    public List<MyDonationDTO> myDnt(Long userId);
    public List<MyOrgDTO> myOrg(Long userId);

}
