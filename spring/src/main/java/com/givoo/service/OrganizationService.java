package com.givoo.service;


import com.givoo.dto.organization.DetailOrgDTO;
import com.givoo.entity.organization.Organization;
import com.givoo.entity.organization.OrganizationNotice;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;


@Service
public interface OrganizationService {
    public List<Organization> findAll();
    public DetailOrgDTO detailOrg(Long orgId,Long userId);
    public List<Organization> searchOrg(String orgName);
    public List<Organization> findType(String orgType);
    public List<Organization> randomOrg();

    Optional<Organization> findById(Long id);
    Organization save(Organization org);

    Long findByUserName(String username);
}
