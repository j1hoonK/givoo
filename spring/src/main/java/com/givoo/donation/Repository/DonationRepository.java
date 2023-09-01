package com.givoo.donation.Repository;

import com.givoo.donation.Entity.DonationEntity;
import com.givoo.donation.Entity.DonationTypeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DonationRepository extends JpaRepository<DonationEntity, Long> {
}

