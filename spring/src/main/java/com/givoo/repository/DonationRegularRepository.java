package com.givoo.repository;

import com.givoo.entity.DonationRegular;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DonationRegularRepository extends JpaRepository<DonationRegular,Long> {
}
