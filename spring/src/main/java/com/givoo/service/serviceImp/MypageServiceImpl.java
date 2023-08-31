package com.givoo.service.serviceImp;

import com.givoo.dto.mypage.MyOrgDTO;
import com.givoo.entity.Favorites;
import com.givoo.entity.donation.Donation;
import com.givoo.repository.FavoritesRepository;
import com.givoo.repository.donation.DonationRepository;
import com.givoo.repository.organization.OrganizationRepository;
import com.givoo.service.MypageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class MypageServiceImpl implements MypageService {

    private final DonationRepository donationRepository;
    private final FavoritesRepository favoritesRepository;
    private final OrganizationRepository organizationRepository;
    @Autowired
    public MypageServiceImpl(DonationRepository donationRepository, FavoritesRepository favoritesRepository, OrganizationRepository organizationRepository) {
        this.donationRepository = donationRepository;
        this.favoritesRepository = favoritesRepository;
        this.organizationRepository = organizationRepository;
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
    public List<Donation> myDnt(Long userId) {
        List<Donation> dntList = donationRepository.findAllByUserId(userId);
        System.out.println("dntList: "+ dntList);
        if(dntList.isEmpty()){
            return null;
        }else{
            return dntList;
        }
    }

    @Override
    public List<MyOrgDTO> myOrg(Long userId) {
        List<Favorites> favList = favoritesRepository.findAllByUserId(userId);
        List<MyOrgDTO> myOrgList = favList.stream()
                .map(fav -> new MyOrgDTO(organizationRepository.findById(fav.getOrgId()).get().getOrgName(),
                        organizationRepository.findById(fav.getOrgId()).get().getImagePath(),
                        organizationRepository.findById(fav.getOrgId()).get().getOrgType()))
                .collect(Collectors.toList());
        return myOrgList;
    }
}


