package com.givoo.service.serviceImp;

import com.givoo.entity.Inquiry;
import com.givoo.repository.InquiryRepository;
import com.givoo.service.InquiryService;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class InquiryServiceImpl implements InquiryService {

    private final InquiryRepository inquiryRepository;

    public InquiryServiceImpl(InquiryRepository inquiryRepository) {
        this.inquiryRepository = inquiryRepository;
    }

    @Override
    public List<Inquiry> findAll() {
        return inquiryRepository.findAll();
    }
}
