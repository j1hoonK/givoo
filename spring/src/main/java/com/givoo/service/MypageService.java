package com.givoo.service;

import com.givoo.dto.mypage.MyOrgDTO;
import com.givoo.entity.Users;
import com.givoo.entity.donation.Donation;
import com.givoo.entity.donation.DonationRegular;
import com.givoo.entity.organization.Organization;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public interface MypageService {

    List<Donation> myDnt(Long userId);

    Donation myDntDetail(Long dntId);

    // 내 단체
    List<MyOrgDTO> myOrg(Long userId);

    // 정기기부 관리
    List<DonationRegular> findByUserID(Long userId);

    // 정기기부 해지신청-해지취소
    List<DonationRegular> findByIsusenowAndDntRegularId(String isusenow, Long dntRegularId);

    List<DonationRegular> findByDntRegularId(Long dntRegularId);

    void fav(Long orgId, Long userId);
    void favUpdate(Long favId);
}
