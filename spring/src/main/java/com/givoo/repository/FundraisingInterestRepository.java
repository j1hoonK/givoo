package com.givoo.repository;

import com.givoo.entity.FundraisingInterest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FundraisingInterestRepository extends JpaRepository<FundraisingInterest,Long> {
}
