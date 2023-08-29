package com.givoo.service;


import com.givoo.dto.organization.DetailOrgDTO;
import com.givoo.dto.organization.SearchOrgDTO;
import com.givoo.entity.organization.Organization;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface OrganizationService {
    public List<Organization> findAll();
    public DetailOrgDTO DetailOrg(Long orgId, Long userId);
    public List<SearchOrgDTO> searchOrg(String orgName);
}
