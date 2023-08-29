package com.givoo.repository.fundraising;

import com.givoo.entity.fundraising.FundraisingJoinList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FundraisingJoinListRepository extends JpaRepository<FundraisingJoinList,Long> {
}
