package com.givoo.repository.donation;

import com.givoo.entity.donation.DonationRegular;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DonationRegularRepository extends JpaRepository<DonationRegular,Long> {
    List<DonationRegular> findByUserId(Long userId);
    List<DonationRegular> findByIsusenowAndDntRegularId(String isusenow, Long dntRegularId);
    List<DonationRegular> findByDntRegularId(Long dntRegularId);

    @Transactional
    @Modifying
    @Query("UPDATE DonationRegular dr SET dr.isusenow = :isusenow WHERE dr.dntRegularId = :dntRegularId")
    void updateIsusenow(@Param("dntRegularId") Long dntRegularId, @Param("isusenow") String isusenow);

}
