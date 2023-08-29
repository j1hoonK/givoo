package com.givoo.repository.donation;

import com.givoo.entity.donation.DonationRegular;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DonationRegularRepository extends JpaRepository<DonationRegular,Long> {
}
