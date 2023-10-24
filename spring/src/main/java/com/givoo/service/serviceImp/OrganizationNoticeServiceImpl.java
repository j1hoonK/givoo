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
            // 여기에서 예외를 로그에 기록하거나 디버깅 정보를 출력
            e.printStackTrace();
            // 또는 로그에 날짜 값을 출력하여 현재 값이 어떤 형식인지 확인
            // logger.error("Error processing date: " + yourDateValue);
            throw e; // 예외를 다시 던지거나, 적절한 방법으로 처리
        }
    }


    @Override
    public void saveNotice(OrganizationNotice orgNotice) {
        organizationNoticeRepository.save(orgNotice);
    }
}
