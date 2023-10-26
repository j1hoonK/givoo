package com.givoo.service;

import com.givoo.entity.Notice;
import com.givoo.repository.NoticeRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {
    public final NoticeRepository noticeRepository;

    public NoticeService(NoticeRepository noticeRepository) {
        this.noticeRepository = noticeRepository;
    }

    public List<Notice> finAll() {
        return noticeRepository.findAll();
    }
}
