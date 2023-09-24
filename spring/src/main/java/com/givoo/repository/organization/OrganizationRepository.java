package com.givoo.repository.organization;

import com.givoo.entity.organization.Organization;
import org.springframework.beans.MutablePropertyValues;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrganizationRepository extends JpaRepository<Organization, Long> {
    List<Organization> findAllByOrgNameContaining(String orgName);
    List<Organization> findAllByOrgType(String orgType);

    Long countBy();
    @Query(value = "SELECT * FROM organization order by RAND() limit 3",nativeQuery = true)
    List<Organization> randomOrg();
}
