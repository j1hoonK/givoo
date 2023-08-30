package com.givoo.service.serviceImp;

import com.givoo.dto.organization.DetailOrgDTO;
import com.givoo.entity.Favorites;
import com.givoo.entity.organization.Organization;
import com.givoo.repository.FavoritesRepository;
import com.givoo.repository.organization.OrganizationRepository;
import com.givoo.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrganizationServiceImpl implements OrganizationService {

    @Autowired
    OrganizationRepository organizationRepo;
    @Autowired
    FavoritesRepository favoritesRepository;

    @Override
    public List<Organization> findAll() {
        return organizationRepo.findAll();
               /* .stream()
                .map(Organization::jpoOf)
                .collect(Collectors.toList());*/
    }

    @Override
    public DetailOrgDTO detailOrg(Long orgId, Long userId) {
        Organization org = organizationRepo.findById(orgId).get();
        Optional<Favorites> fav = favoritesRepository.findById(userId);
        DetailOrgDTO detailOrg;
        if (fav.isEmpty()) {
            detailOrg = org.converter(0L);
        } else {
            detailOrg = org.converter(fav.get().getFavId());
        }
        return detailOrg;

    }

    @Override
    public List<Organization> searchOrg(String orgName) {
        return organizationRepo.findAllByOrgName(orgName);
    }
}
