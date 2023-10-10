package com.givoo.repository.request;

import com.givoo.entity.organization.OrganizationNotice;
import com.givoo.entity.request.RequestEdit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RequestEditRepository extends JpaRepository<RequestEdit,Long> {
}
