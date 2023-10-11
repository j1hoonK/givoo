package com.givoo.repository.request;

import com.givoo.entity.request.RequestOrganization;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RequestOrganizationRepository extends JpaRepository<RequestOrganization,Long> {
}
