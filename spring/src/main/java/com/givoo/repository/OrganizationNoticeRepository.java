package com.givoo.repository;

import com.givoo.entity.OrganizationNotice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrganizationNoticeRepository extends JpaRepository<OrganizationNotice,Long> {
}
