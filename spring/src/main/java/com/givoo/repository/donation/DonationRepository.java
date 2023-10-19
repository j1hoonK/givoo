package com.givoo.repository.donation;

import com.givoo.dto.donation.DonationSendDTO;
import com.givoo.entity.Users;
import com.givoo.entity.donation.Donation;

import com.givoo.entity.donation.DonationRegular;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DonationRepository extends JpaRepository<Donation,Long> {
    List<Donation> findAllByUserId(Long userId);
    List<Donation> findAllByOrgId(Long OrgId);
}
