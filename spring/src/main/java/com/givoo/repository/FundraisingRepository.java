package com.givoo.repository;

import com.givoo.entity.Fundraising;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FundraisingRepository extends JpaRepository<Fundraising,Long> {
}
