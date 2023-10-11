package com.givoo.repository.organization;

import com.givoo.entity.organization.OrganizationNotice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrganizationNoticeRepository extends JpaRepository<OrganizationNotice,Long> {
     List<OrganizationNotice> findByOrgId(Long id);
}
