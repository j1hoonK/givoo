package com.givoo.service;

import com.givoo.entity.Inquiry;
import org.springframework.stereotype.Service;


import java.util.List;
@Service
public interface InquiryService {
    List<Inquiry> findAll();
}
