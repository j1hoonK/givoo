package com.givoo.repository.donation;

import com.givoo.entity.donation.DonationType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DonationTypeRepository extends JpaRepository<DonationType,Long> {
    public List<DonationType> findAllByOrgId(Long orgId);
}
