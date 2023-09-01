package com.givoo.donation.Repository;

import com.givoo.donation.Entity.DonationTypeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DonationTypeRepository extends JpaRepository<DonationTypeEntity, Long> {

    // 기관ID로 기부금 종류 검색
    List<DonationTypeEntity> findByOrgId(Long org_id);
}
