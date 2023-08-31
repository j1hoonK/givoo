package com.givoo.repository.fundraising;

import com.givoo.entity.fundraising.FundraisingInterest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FundraisingInterestRepository extends JpaRepository<FundraisingInterest,Long> {
}
