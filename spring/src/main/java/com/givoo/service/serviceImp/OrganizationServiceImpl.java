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

    private final OrganizationRepository organizationRepo;
    private final FavoritesRepository favoritesRepository;

    @Autowired
    public OrganizationServiceImpl(OrganizationRepository organizationRepo, FavoritesRepository favoritesRepository) {
        this.organizationRepo = organizationRepo;
        this.favoritesRepository = favoritesRepository;
    }

    @Override
    public List<Organization> findAll() {
        return organizationRepo.findAll();
    }

    @Override
    public DetailOrgDTO detailOrg(Long orgId, Long userId) {
//        Optional<Organization> orgOptional = organizationRepo.findById(orgId);
//        Optional<Favorites> favOptional = favoritesRepository.findById(userId);
//        if(orgOptional.isPresent()&&favOptional.isPresent()){
//            return orgOptional.get().converter(favOptional.get().getFavId());
//        } else return orgOptional.map(organization -> organization.converter(0L)).orElse(null);
        return null;
    }

    @Override
    public List<Organization> searchOrg(String orgName) {
        return organizationRepo.findAllByOrgNameContaining(orgName);
    }
    @Override
    public List<Organization> findType(String orgType){
        return organizationRepo.findAllByOrgType(orgType);
    }
}
