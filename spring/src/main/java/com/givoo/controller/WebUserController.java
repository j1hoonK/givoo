package com.givoo.controller;

import com.givoo.entity.Users;
import com.givoo.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class WebUserController {

    @Autowired
    private final UsersService usersService;

    public WebUserController(UsersService usersService) {
        this.usersService = usersService;
    }


    @RequestMapping("/user/{pages}")
    public String main(@PathVariable("pages") int pages, Model model) {
      List<Users> userList = usersService.findAll();
      int pageSize = 10;
      int totalUsers = userList.size();
      int totalPages = (int) Math.ceil((double) totalUsers / pageSize);
        // 페이지 번호를 받아올 수 있는 파라미터 (예: ?page=2)
        int currentPage = 1; // 기본 페이지 번호
        if (pages < totalUsers) {
            currentPage = pages;
        }

        int startIdx = (currentPage - 1) * pageSize;
        int endIdx = Math.min(currentPage * pageSize, totalUsers);

        // 현재 페이지에 해당하는 유저 리스트만 추출
        List<Users> currentPageUsers = userList.subList(startIdx, endIdx);


        model.addAttribute("totalPages", totalPages); // 전체 페이지 수를 모델에 추가
        model.addAttribute("currentPage", currentPage); // 현재 페이지 번호를 모델에 추가
        model.addAttribute("users", userList); // 현재 페이지의 유저 리스트를 모델에 추가
        return "main_user";
    }
}
