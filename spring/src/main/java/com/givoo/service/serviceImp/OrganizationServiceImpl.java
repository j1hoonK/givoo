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
import java.util.stream.Collectors;

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
        Optional<Organization> orgOptional = organizationRepo.findById(orgId);
        Favorites favOptional = favoritesRepository.findByOrgIdAndUserId(orgId,userId);
        if(orgOptional.isPresent()&&favOptional != null){
            return orgOptional.get().converter(favOptional.getFavId(),favOptional.getFav_flag());
        } else return orgOptional.map(organization -> organization.converter(0L,0)).orElse(null);

    }

    @Override
    public List<Organization> searchOrg(String orgName) {
        return organizationRepo.findAllByOrgNameContaining(orgName);
    }
    @Override
    public List<Organization> findType(String orgType){
        return organizationRepo.findAllByOrgType(orgType);
    }
    @Override
    public List<Organization> randomOrg() {
        Long count = organizationRepo.countBy();
        if(count < 3) {
            return organizationRepo.findAll();
        }
        return organizationRepo.randomOrg();
    }

    @Override
    public Optional<Organization> findById(Long id) {
        return organizationRepo.findById(id);
    }

    @Override
    public Organization save(Organization org) {
        return organizationRepo.save(org);
    }

    @Override
    public Long findByUserName(String username) {
        return organizationRepo.findByUsername(username).getOrgId();
    }
}
