package com.givoo.service.serviceImp;

import com.givoo.entity.Inquiry;
import com.givoo.repository.InquiryRepository;
import com.givoo.service.InquiryService;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

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



    @Override
    public Optional<Inquiry> findById(Long id){
        return inquiryRepository.findById(id);
    }
    @Override
    public void asnwerSave(Long id,String answer) {
        Optional<Inquiry> inq =inquiryRepository.findById(id);
        Inquiry inquiry = inq.orElse(null);
        if (inquiry != null) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
            inquiry.setStatus("1");
            inquiry.setAnswer(answer);
            inquiry.setAnswerCreated(dateFormat.format(new Date()));
        } else {
        }
        inquiryRepository.save(inquiry);
    }
}
