package com.givoo.repository;

import com.givoo.entity.FundraisingJoinList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FundraisingJoinListRepository extends JpaRepository<FundraisingJoinList,Long> {
}
