package baro.baro.controller;

import baro.baro.Entity.Organization;
import baro.baro.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class HomeController {

    final OrganizationService organizationService;

    @Autowired
    public HomeController(OrganizationService organizationService) {
        this.organizationService = organizationService;
    }


    @GetMapping("/org")
    public List<Organization> findAll(Model model) {
        return organizationService.findAll();
    }

}
