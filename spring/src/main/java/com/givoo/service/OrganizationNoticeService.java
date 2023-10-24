package com.givoo.service;

import com.givoo.entity.organization.OrganizationNotice;
import org.springframework.stereotype.Service;


import java.util.List;
@Service
public interface OrganizationNoticeService {
    List<OrganizationNotice> findByOrgId(Long id);
    List<OrganizationNotice> findAllByOrgId(Long orgId);
}