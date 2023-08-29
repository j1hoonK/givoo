package com.givoo.repository.organization;

import com.givoo.entity.organization.OrganizationNotice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrganizationNoticeRepository extends JpaRepository<OrganizationNotice,Long> {
}
