package com.givoo.service;

import com.givoo.dto.donation.DonationDTO;
import com.givoo.dto.mypage.MyOrgDTO;
import com.givoo.entity.donation.Donation;
import com.givoo.entity.donation.DonationRegular;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public interface MypageService {

    List<DonationDTO> getDonationsByUserId(Long userId);
    List<MyOrgDTO> myOrg(Long userId);
    Donation myDntDetail(Long dntId);

    // 정기기부 관리
    List<DonationRegular> findByUserID(Long userId);

    // 정기기부 해지신청-해지취소
    List<DonationRegular> findByIsusenowAndDntRegularId(String isusenow, Long dntRegularId);

    List<DonationRegular> findByDntRegularId(Long dntRegularId);

    void fav(Long orgId,Long userId);

    void favDel(Long favId);
}
