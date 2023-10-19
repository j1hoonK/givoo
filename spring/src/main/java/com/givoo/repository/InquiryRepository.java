package com.givoo.repository;


import com.givoo.entity.Inquiry;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface InquiryRepository extends JpaRepository<Inquiry,Long> {
    List<Inquiry> findAllByUserId(Long userId);

}