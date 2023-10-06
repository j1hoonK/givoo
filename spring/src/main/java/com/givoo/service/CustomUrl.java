package com.givoo.service;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
@Component
public class CustomUrl implements AuthenticationSuccessHandler {

    private final OrganizationService organizationService;

    public CustomUrl(OrganizationService organizationService) {
        this.organizationService = organizationService;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        // 사용자별로 다른 URL로 리다이렉션할 수 있는 로직을 구현

        if (authentication.getName().equals("admin")) {
            response.sendRedirect("/user/1");
        } else {

            Long id = organizationService.findByUserName(authentication.getName());
            response.sendRedirect("/members/org/"+id);
        }
    }
}
