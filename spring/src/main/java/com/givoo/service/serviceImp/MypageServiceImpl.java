package com.givoo.service.serviceImp;

import com.givoo.dto.mypage.DonationRegulationDTO;
import com.givoo.dto.mypage.MyDonationDTO;
import com.givoo.dto.mypage.MyOrgDTO;
import com.givoo.entity.donation.Donation;
import com.givoo.repository.FavoritesRepository;
import com.givoo.repository.donation.DonationRepository;
import com.givoo.service.MypageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MypageServiceImpl implements MypageService {

    private final DonationRepository donationRepository;
    private final FavoritesRepository favoritesRepository;

    @Autowired
    public MypageServiceImpl(DonationRepository donationRepository, FavoritesRepository favoritesRepository) {
        this.donationRepository = donationRepository;
        this.favoritesRepository = favoritesRepository;
    }

    @Override
    public Donation myDntDetail(Long dntId) {
        Optional<Donation> donationOptional = donationRepository.findById(dntId);

        if (donationOptional.isPresent()) {
            return donationOptional.get();
        } else {
            throw new IllegalArgumentException("Donation with ID " + dntId + " not found.");
        }
    }

    @Override
    public List<MyDonationDTO> myDnt(Long userId) {
        favoritesRepository.findById(userId);
        return null;
    }

    @Override
    public List<MyOrgDTO> myOrg(Long userId) {
        return null;
    }

    @Override
    public DonationRegulationDTO dntRegulation(Long userId) {
        return null;
    }
}
