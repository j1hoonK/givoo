package com.givoo.service.serviceImp;

import com.givoo.dto.organization.DetailOrgDTO;
import com.givoo.dto.organization.SearchOrgDTO;
import com.givoo.entity.organization.Organization;
import com.givoo.repository.FavoritesRepository;
import com.givoo.repository.organization.OrganizationRepository;
import com.givoo.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrganizationServiceImpl implements OrganizationService {
    @Autowired
    OrganizationRepository OrganizationRepo;
    @Autowired
    FavoritesRepository favoritesRepository;

    @Override
    public List<Organization> findAll() {
        return OrganizationRepo.findAll();
               /* .stream()
                .map(Organization::jpoOf)
                .collect(Collectors.toList());*/
    }

    @Override
    public DetailOrgDTO DetailOrg(Long orgId, Long userId) {
        return null;
    }

    @Override
    public List<SearchOrgDTO> searchOrg(String orgName) {
        return null;
    }
}
