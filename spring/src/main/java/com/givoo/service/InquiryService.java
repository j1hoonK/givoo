package com.givoo.service;

import com.givoo.entity.Inquiry;
import org.springframework.stereotype.Service;


import java.util.List;
import java.util.Optional;

@Service
public interface InquiryService {
    List<Inquiry> findAll();

    Optional<Inquiry> findById(Long id);

    void asnwerSave(Long id,String answer);
}
