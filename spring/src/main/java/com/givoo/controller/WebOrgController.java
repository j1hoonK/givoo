package com.givoo.controller;

import com.givoo.entity.donation.Donation;
import com.givoo.entity.organization.Organization;
import com.givoo.entity.organization.OrganizationNotice;
import com.givoo.entity.request.RequestEdit;
import com.givoo.service.DonationService;
import com.givoo.service.OrganizationNoticeService;
import com.givoo.service.OrganizationService;
import com.givoo.service.RequestEditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/auth/org")
public class WebOrgController {
    private final OrganizationService organizationService;
    private final DonationService donationService;
    private final OrganizationNoticeService organizationNoticeService;
    private final RequestEditService requestEditService;
    @Autowired
    public WebOrgController(OrganizationService organizationService, DonationService donationService, OrganizationNoticeService organizationNoticeService, RequestEditService requestEditService) {
        this.organizationService = organizationService;
        this.donationService = donationService;
        this.organizationNoticeService = organizationNoticeService;
        this.requestEditService = requestEditService;
    }
    @GetMapping("/edit/{id}")
    public String orgEdit(@PathVariable("id") Long id, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        Optional<Organization> organization = organizationService.findById(id);
        if (organization == null) {
            // 기관을 찾을 수 없음. 에러 페이지 또는 리다이렉션 처리
            return "error";
        }
        model.addAttribute("org", organization);
            return "org_edit";
    }
    @GetMapping("/{id}")
    public String viewOrganization(@PathVariable("id") Long id, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        Optional<Organization> organization = organizationService.findById(id);
        if (organization == null) {
            // 기관을 찾을 수 없음. 에러 페이지 또는 리다이렉션 처리
            return "error";
        }
        if(username.equals(organization.get().getUsername())) {
            List<Donation> donations = donationService.findByOrgId(id);
            List<OrganizationNotice> orgNotice = organizationNoticeService.findByOrgId(id);
            model.addAttribute("organization", organization);
            model.addAttribute("donations", donations);
            model.addAttribute("orgNotice",orgNotice);
            return "org_main2";
        }
        return "error";
    }
    @PostMapping("/edit/{id}")
    public String editOrg(@PathVariable("id") Long id,
                          @RequestParam("orgName") String orgName,
                          @RequestParam("orgOwner") String orgOwner,
                          @RequestParam("orgType") String orgType,
                          @RequestParam("orgTell") String orgTell,
                          @RequestParam("orgInfo") String orgInfo,
                          @RequestParam("homepage") String homepage,
                          @RequestParam("accountNumber") String accountNumber,
                          @RequestParam("accountHolder") String accountHolder){
        Optional<Organization> orgOptional = organizationService.findById(id);
        orgOptional.ifPresent(org -> {
            // 값이 있는 경우에만 이 블록이 실행됨
            Organization org2 = orgOptional.get();
            org2.setOrgName(orgName);
            org2.setOrgOwner(orgOwner);
            org2.setOrgType(orgType);
            org2.setOrgTell(orgTell);
            org2.setOrgInfo(orgInfo);
            org2.setHompage(homepage);
            org2.setAccountNumber(accountNumber);
            org2.setAccountHolder(accountHolder);
            //organizationService.save(org2);
            // 이제 'org' 변수에 Organization 객체가 들어있습니다.
            // 여기서 'org'를 사용할 수 있습니다.
            RequestEdit editOrg = new RequestEdit();
            editOrg.setHompage(homepage);
            editOrg.setOrgInfo(orgInfo);
            editOrg.setAccountHolder(accountHolder);
            editOrg.setOrgName(orgName);
            //editOrg.setOrgAddress(org2.getOrgAddress());
            editOrg.setAccountNumber(accountNumber);
            //editOrg.setBankName(org2.getBankName());
            // editOrg.setOrgNotice(org2.getOrgNotice());
            // editOrg.setOrgNumber(org2.getOrgNumber());
            editOrg.setOrgOwner(orgOwner);
            editOrg.setOrgId(id);
            editOrg.setOrgTell(orgTell);
            editOrg.setOrgType(orgType);
            editOrg.setLocationLat(org2.getLocationLat());
            editOrg.setLocationLong(org2.getLocationLong());
            editOrg.setOrgAddress(org2.getOrgAddress());
            editOrg.setStartedUp(org2.getStartedUp());
            editOrg.setTotalFavorite(org2.getTotalFavorite());
            editOrg.setOrgNumber(org2.getOrgNumber());
            editOrg.setUsername(org2.getUsername());
            editOrg.setImagePath(org2.getImagePath());
            editOrg.setOrgNotice(org2.getOrgNotice());
            editOrg.setOrgOwnnumber(org2.getOrgOwnnumber());
            editOrg.setZip(org2.getZip());
            editOrg.setBankName(org2.getBankName());
            System.out.println("editOrg:" + editOrg);
            requestEditService.save(editOrg);
        });
        return "org_main2";
        }


    @GetMapping("/dnt/{id}")
    public String dntList(@PathVariable ("id") Long id) {
        return "org_dntlist";
    }
    @GetMapping("/notice/{id}")
    public String noticeList(@PathVariable ("id") Long id) {
        return "org_noticelist";
    }
}
