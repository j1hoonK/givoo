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
                          @RequestParam("address") String address,
                          @RequestParam("orgOwnnumber") String orgOwnnumber,
                          @RequestParam("startedUp") String startedUp,
                          @RequestParam("bankName") String bankName,
                          @RequestParam("orgName") String orgName,
                          @RequestParam("orgOwner") String orgOwner,
                          @RequestParam("orgType") String orgType,
                          @RequestParam("orgTell") String orgTell,
                          @RequestParam("orgInfo") String orgInfo,
                          @RequestParam("homepage") String homepage,
                          @RequestParam("accountNumber") String accountNumber,
                          @RequestParam("accountHolder") String accountHolder,
                          @RequestParam("zip") String zip){
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
            RequestEdit editOrg = new RequestEdit();
            editOrg.setHompage(homepage);
            editOrg.setOrgInfo(orgInfo);
            editOrg.setAccountHolder(accountHolder);
            editOrg.setOrgName(orgName);
            editOrg.setAccountNumber(accountNumber);
            editOrg.setOrgOwner(orgOwner);
            editOrg.setOrgId(id);
            editOrg.setOrgTell(orgTell);
            editOrg.setOrgType(orgType);
            editOrg.setOrgAddress(address);
            editOrg.setStartedUp(startedUp);
            editOrg.setTotalFavorite(org2.getTotalFavorite());
            editOrg.setUsername(org2.getUsername());
            editOrg.setOrgOwnnumber(orgOwnnumber);
            editOrg.setZip(zip);
            editOrg.setBankName(bankName);
            System.out.println("editOrg:" + editOrg);
            requestEditService.save(editOrg);
        });
        return "redirect:/auth/org/"+id;
        }


    @GetMapping("/dnt/{id}")
    public String dntList(@PathVariable ("id") Long id) {
        return "org_dntlist";
    }
    @GetMapping("/notice/{id}")
    public String noticeList(@PathVariable ("id") Long id) {
        return "org_noticelist";
    }

    @GetMapping("/notice/register/{id}")
    public String noticeRegister(@PathVariable ("id") Long id){
        return "org_notice_register";
    }

    @PostMapping("/notice/register/{id}")
    public String noticeRegister(@PathVariable ("id") Long id,
                                 @RequestParam("subject") String subject,
                                 @RequestParam("contents") String contents){

        OrganizationNotice orgNotice = new OrganizationNotice(subject,contents,id);
        organizationNoticeService.saveNotice(orgNotice);
        return "redirect:/auth/org/"+id;
    }

}
