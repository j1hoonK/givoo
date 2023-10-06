package com.givoo.service.serviceImp;

import com.givoo.entity.Users;
import com.givoo.entity.donation.Donation;
import com.givoo.entity.donation.DonationType;
import com.givoo.entity.organization.Organization;
import com.givoo.repository.donation.DonationRegularRepository;
import com.givoo.repository.donation.DonationRepository;
import com.givoo.repository.donation.DonationTypeRepository;
import com.givoo.service.DonationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class DonationServiceImpl implements DonationService {

    private final DonationRegularRepository donationRegularRepository;
    private final DonationTypeRepository donationTypeRepository;
    private final DonationRepository donationRepository;

    @Autowired
    public DonationServiceImpl(DonationRegularRepository donationRegularRepository, DonationTypeRepository donationTypeRepository, DonationRepository donationRepository) {
        this.donationRegularRepository = donationRegularRepository;
        this.donationTypeRepository = donationTypeRepository;
        this.donationRepository = donationRepository;
    }


    @Override
    public List<DonationType> findByOrgIdFromDonation(Long orgId) {
        List<DonationType> dntList= donationTypeRepository.findAllByOrgId(orgId);
        if(dntList.isEmpty()){
            return null;
        }
        return dntList;
    }

    @Override
    public String dntSend(Long orgId, Long userId, String dntType, Long dntAmount, String typePayment, String dntComment, Date dntDate, String isRegulation, String dntCommentRegulation){
        Donation dnt = new Donation(null,dntAmount,dntDate,null
                ,orgId,userId,typePayment,dntComment,isRegulation,dntCommentRegulation,dntType);
        donationRepository.save(dnt);
        return "완료";
    }
    @Override
    public Donation sendDonation(Donation donation){
        return donationRepository.save(donation);
    }

    @Override
    public Optional<Donation> dnt(Long id) {
        return donationRepository.findById(id);
    }
}
