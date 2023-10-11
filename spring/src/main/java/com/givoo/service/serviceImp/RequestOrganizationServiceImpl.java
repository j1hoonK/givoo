package com.givoo.service.serviceImp;


import com.givoo.entity.request.RequestOrganization;
import com.givoo.repository.request.RequestOrganizationRepository;
import com.givoo.service.RequestOrganizationService;

public class RequestOrganizationServiceImpl implements RequestOrganizationService {
    private final RequestOrganizationRepository requestOrganizationRepository;

    public RequestOrganizationServiceImpl(RequestOrganizationRepository requestOrganizationRepository) {
        this.requestOrganizationRepository = requestOrganizationRepository;
    }

    @Override
    public void save(RequestOrganization organization) {
        requestOrganizationRepository.save(organization);

    }
}
