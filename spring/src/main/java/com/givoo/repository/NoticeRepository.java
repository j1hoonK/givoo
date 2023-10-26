package com.givoo.repository;

import com.givoo.entity.Member;
import com.givoo.entity.Notice;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NoticeRepository extends JpaRepository<Notice, Long> {

}
