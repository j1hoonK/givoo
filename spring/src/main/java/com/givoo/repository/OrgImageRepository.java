package com.givoo.repository;

import com.givoo.entity.OrgImage;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrgImageRepository extends JpaRepository<OrgImage,Long> {
    List<OrgImage> findAllByOrgId(Long id);
}
