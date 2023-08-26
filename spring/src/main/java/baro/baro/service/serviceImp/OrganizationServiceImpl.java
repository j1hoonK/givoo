package baro.baro.service.serviceImp;

import baro.baro.Entity.Organization;
import baro.baro.dto.OrganizationDto;
import baro.baro.repository.OrganizationRepository;
import baro.baro.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

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
