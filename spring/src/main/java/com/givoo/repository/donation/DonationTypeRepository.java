package com.givoo.repository.donation;

import com.givoo.entity.donation.DonationType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DonationTypeRepository extends JpaRepository<DonationType,Long> {
}
