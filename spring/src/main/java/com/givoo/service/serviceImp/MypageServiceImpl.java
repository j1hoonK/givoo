package com.givoo.service.serviceImp;

import com.givoo.dto.mypage.MyDonationDTO;
import com.givoo.dto.mypage.MyDonationDetailDTO;
import com.givoo.dto.mypage.MyOrgDTO;
import com.givoo.entity.donation.Donation;
import com.givoo.repository.FavoritesRepository;
import com.givoo.repository.donation.DonationRepository;
import com.givoo.service.MypageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MypageServiceImpl implements MypageService {
    @Autowired
    DonationRepository donationRepository;
    @Autowired
    FavoritesRepository favoritesRepository;
    @Override
    public MyDonationDetailDTO myDntDetail(Long dntId) {
        Donation abc = donationRepository.findById(dntId).get();
        MyDonationDetailDTO myDonationDetailDTO = new MyDonationDetailDTO(
                abc.getOrgId(),abc.getDntDate(),abc.getDntAmount()
                ,abc.getIsRegulation(),abc.getReceiptResult()
                ,abc.getTypePayment(),abc.getDntComment(),
                abc.getDntCommentRegulation(),abc.getDntType());
        return myDonationDetailDTO;
    }

    @Override
    public List<MyDonationDTO> myDnt(Long userId) {

        return null;
    }

    @Override
    public List<MyOrgDTO> myOrg(Long userId) {
        return null;
    }
}
