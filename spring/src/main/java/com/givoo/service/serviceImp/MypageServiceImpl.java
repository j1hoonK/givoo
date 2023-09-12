package com.givoo.service.serviceImp;

import com.givoo.dto.mypage.MyOrgDTO;
import com.givoo.entity.Favorites;
import com.givoo.entity.donation.Donation;
import com.givoo.entity.donation.DonationRegular;
import com.givoo.repository.FavoritesRepository;
import com.givoo.repository.donation.DonationRegularRepository;
import com.givoo.repository.donation.DonationRepository;
import com.givoo.repository.organization.OrganizationRepository;
import com.givoo.service.MypageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.PublicKey;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class MypageServiceImpl implements MypageService {

    private final DonationRepository donationRepository;
    private final DonationRegularRepository donationRegularRepository;
    private final FavoritesRepository favoritesRepository;
    private final OrganizationRepository organizationRepository;
    @Autowired
    public MypageServiceImpl(DonationRepository donationRepository, DonationRegularRepository donationRegularRepository, FavoritesRepository favoritesRepository, OrganizationRepository organizationRepository) {
        this.donationRepository = donationRepository;
        this.donationRegularRepository = donationRegularRepository;
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

    @Override   // 기부이력 확인
    public List<Donation> myDnt(Long userId) {
        List<Donation> dntList = donationRepository.findAllByUserId(userId);
        System.out.println("dntList: "+ dntList);
        if(dntList.isEmpty()){
            return null;
        }else{
            return dntList;
        }
    }

    @Override   // 내 단체
    public List<MyOrgDTO> myOrg(Long userId) {
        List<Favorites> favList = favoritesRepository.findAllByUserId(userId);
        List<MyOrgDTO> myOrgList = favList.stream()
                .map(fav -> new MyOrgDTO(organizationRepository.findById(fav.getOrgId()).get().getOrgName(),
                        organizationRepository.findById(fav.getOrgId()).get().getImagePath(),
                        organizationRepository.findById(fav.getOrgId()).get().getOrgType(),
                        organizationRepository.findById(fav.getOrgId()).get().getOrgId(),
                        organizationRepository.findById(fav.getOrgId()).get().getOrgAddress()
                        ))
                .collect(Collectors.toList());
        return myOrgList;
    }

    @Override   // 정기기부 관리
    public List<DonationRegular> findByUserID(Long userId) {
        return donationRegularRepository.findByUserId(userId);
    }

    @Override
    public List<DonationRegular> findByIsusenowAndDntRegularId(String isusenow, Long dntRegularId) {
        return donationRegularRepository.findByIsusenowAndDntRegularId(isusenow, dntRegularId);
    }

    @Override
    public List<DonationRegular> findByDntRegularId(Long dntRegularId) {
        List<DonationRegular> donationRegulars = donationRegularRepository.findByDntRegularId(dntRegularId);

        if (!donationRegulars.isEmpty()) {
            for (DonationRegular donationRegular : donationRegulars) {
                // 'Y'를 'N'으로, 'N'을 'Y'로 변경
                donationRegular.setIsusenow(donationRegular.getIsusenow().equals("Y") ? "N" : "Y");
                donationRegularRepository.updateIsusenow(dntRegularId, donationRegular.getIsusenow());
            }
        }
        return donationRegulars;
    }

    @Override
    public void fav(Long orgId, Long userId) {
        Favorites fav = new Favorites(orgId,userId);
        favoritesRepository.save(fav);
    }

    @Override
    public void favDel(Long favId) {
        favoritesRepository.deleteById(favId);
    }


}


