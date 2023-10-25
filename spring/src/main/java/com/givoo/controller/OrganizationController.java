package com.givoo.controller;

import com.givoo.dto.organization.DetailOrgDTO;
import com.givoo.entity.organization.Organization;
import com.givoo.entity.organization.OrganizationNotice;
import com.givoo.service.DonationService;
import com.givoo.service.MemberService;
import com.givoo.service.OrganizationNoticeService;
import com.givoo.service.OrganizationService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name = "Organization", description = "기관 관련 API")
@RestController
public class OrganizationController {
    private final PasswordEncoder passwordEncoder;
    private final OrganizationService organizationService;
    private final OrganizationNoticeService organizationNoticeService;
    private final MemberService memberService;
    private final DonationService donationService;

    @Autowired
    public OrganizationController(PasswordEncoder passwordEncoder, OrganizationService organizationService, OrganizationNoticeService organizationNoticeService, MemberService memberService, DonationService donationService) {
        this.passwordEncoder = passwordEncoder;
        this.organizationService = organizationService;
        this.organizationNoticeService = organizationNoticeService;
        this.memberService = memberService;
        this.donationService = donationService;
    }


    @GetMapping("/info/{orgid}/{userid}")
    @Operation(summary = "기관 정보", description = "기관 상세정보 및 관심기관 등록정보 반영")
    public DetailOrgDTO detailOrg(@PathVariable("orgid") Long orgid, @PathVariable("userid") Long userid){
        return organizationService.detailOrg(orgid,userid);
    }
    @GetMapping("/search/{orgname}")
    @Operation(summary = "기관 검색", description = "기관명 일부로 검색 가능")
    public List<Organization> searchOrg(@PathVariable("orgname") String orgname){
        return organizationService.searchOrg(orgname);
    }
    @GetMapping("/info/orgtype/{orgtype}")
    @Operation(summary = "기관 분류", description = "기관 타입별 분류")
    public List<Organization> orgType(@PathVariable("orgtype") String orgType){
        return organizationService.findType(orgType);
    }
    @GetMapping("/mainpage")
    @Operation(summary = "기관 추천", description = "랜덤으로 3개의 기관 추천")
    public List<Organization> ranOrg(){
        return organizationService.randomOrg();

    }

    @GetMapping("/org/notice/{orgid}")
    @Operation(summary = "기관 공지", description = "기관별 공지사항 리스트 검색")
    public List<OrganizationNotice> orgNotice(@PathVariable("orgid") Long orgId){
        return organizationNoticeService.findAllByOrgId(orgId);
    }


}
