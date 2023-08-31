package com.givoo.repository.donation;

import com.givoo.entity.donation.Donation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DonationRepository extends JpaRepository<Donation,Long> {
    List<Donation> findAllByUserId(Long userId);
}
