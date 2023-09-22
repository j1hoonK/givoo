package com.givoo.controller;

import com.givoo.dto.organization.DetailOrgDTO;
import com.givoo.entity.organization.Organization;
import com.givoo.service.OrganizationService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@Tag(name = "Organization", description = "기관 관련 API")
@RestController
public class OrganizationController {

    private final OrganizationService organizationService;

    @Autowired
    public OrganizationController(OrganizationService organizationService) {
        this.organizationService = organizationService;
    }


    @GetMapping("/info/{orgid}/{userid}")
    public DetailOrgDTO detailOrg(@PathVariable("orgid") Long orgid, @PathVariable("userid") Long userid){
        return organizationService.detailOrg(orgid,userid);
    }
    @GetMapping("/search/{orgname}")
    public List<Organization> searchOrg(@PathVariable("orgname") String orgname){
        return organizationService.searchOrg(orgname);
    }
    @GetMapping("/info/orgtype/{orgtype}")
    public List<Organization> orgType(@PathVariable("orgtype") String orgType){
        return organizationService.findType(orgType);
    }
    @GetMapping("/mainpage")
    public List<Organization> ranOrg(){
        return organizationService.randomOrg();

    }


}
