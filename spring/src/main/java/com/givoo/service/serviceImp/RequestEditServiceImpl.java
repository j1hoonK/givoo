package com.givoo.service.serviceImp;

import com.givoo.entity.organization.Organization;
import com.givoo.entity.request.RequestEdit;
import com.givoo.repository.organization.OrganizationRepository;
import com.givoo.repository.request.RequestEditRepository;
import com.givoo.service.RequestEditService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RequestEditServiceImpl implements RequestEditService {
    private final RequestEditRepository requestEditRepository;
    private final OrganizationRepository organizationRepository;

    public RequestEditServiceImpl(RequestEditRepository requestEditRepository, OrganizationRepository organizationRepository) {
        this.requestEditRepository = requestEditRepository;
        this.organizationRepository = organizationRepository;
    }

    @Override
    public RequestEdit save(RequestEdit requestEdit) {
       return requestEditRepository.save(requestEdit);
    }

    @Override
    public List<RequestEdit> findAll() {
        return requestEditRepository.findAll();
    }

    @Override
    public Optional<RequestEdit> findById(Long id) {
        return requestEditRepository.findById(id);
    }

    @Override
    public void deleteById(Long id) {
        requestEditRepository.deleteById(id);
    }
}