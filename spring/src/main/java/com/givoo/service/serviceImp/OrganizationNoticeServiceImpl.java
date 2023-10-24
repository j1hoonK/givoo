package com.givoo.service.serviceImp;

import com.givoo.entity.organization.OrganizationNotice;
import com.givoo.repository.organization.OrganizationNoticeRepository;
import com.givoo.service.OrganizationNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrganizationNoticeServiceImpl implements OrganizationNoticeService {

    private final OrganizationNoticeRepository organizationNoticeRepository;
    @Autowired
    public OrganizationNoticeServiceImpl(OrganizationNoticeRepository organizationNoticeRepository) {
        this.organizationNoticeRepository = organizationNoticeRepository;
    }

    @Override
    public List<OrganizationNotice> findByOrgId(Long id) {
        return organizationNoticeRepository.findByOrgId(id);
    }

    @Override
    public List<OrganizationNotice> findAllByOrgId(Long orgId) {
        try {
            return organizationNoticeRepository.findAllByOrgId(orgId);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }


    @Override
    public void saveNotice(OrganizationNotice orgNotice) {
        organizationNoticeRepository.save(orgNotice);
    }
}
