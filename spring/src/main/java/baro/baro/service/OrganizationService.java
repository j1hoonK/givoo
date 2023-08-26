package baro.baro.service;


import baro.baro.Entity.Organization;
import baro.baro.dto.OrganizationDto;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface OrganizationService {
    public List<Organization> findAll();
}
