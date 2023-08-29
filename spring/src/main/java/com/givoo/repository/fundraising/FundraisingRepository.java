package com.givoo.repository.fundraising;

import com.givoo.entity.fundraising.Fundraising;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FundraisingRepository extends JpaRepository<Fundraising,Long> {
}
