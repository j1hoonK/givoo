package com.givoo.service;


import com.givoo.entity.organization.Organization;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface OrganizationService {
    public List<Organization> findAll();
}
