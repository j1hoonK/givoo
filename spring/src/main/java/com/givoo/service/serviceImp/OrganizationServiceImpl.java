package com.givoo.service.serviceImp;

import com.givoo.entity.organization.Organization;
import com.givoo.repository.organization.OrganizationRepository;
import com.givoo.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrganizationServiceImpl implements OrganizationService {
    @Autowired
    OrganizationRepository OrganizationRepo;

    @Override
    public List<Organization> findAll() {
        return OrganizationRepo.findAll();
               /* .stream()
                .map(Organization::jpoOf)
                .collect(Collectors.toList());*/
    }
}
