package com.givoo.controller;

import com.givoo.entity.Users;
import com.givoo.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
public class WebUserController {


    private final UsersService usersService;

    @Autowired
    public WebUserController(UsersService usersService) {
        this.usersService = usersService;
    }

    @GetMapping("/user/{pages}")
    public String main(@PathVariable("pages") int pages, Model model) {
      List<Users> userList = usersService.findAll();
      int pageSize = 15;
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

        System.out.println("....................................................................");
        System.out.println(model);
        System.out.println(currentPageUsers.get(0).getUserAddress());

        model.addAttribute("totalPages", totalPages); // 전체 페이지 수를 모델에 추가
        model.addAttribute("currentPage", currentPage); // 현재 페이지 번호를 모델에 추가
        model.addAttribute("users", currentPageUsers); // 현재 페이지의 유저 리스트를 모델에 추가
        return "main_user";
    }
    @GetMapping("/")
    public String join(){
        return "join";
    }

    // 사용자 정보 수정
    @PutMapping("/user/{userId}/update")
    public String updateUser(@PathVariable Long userId, Users users,Model model) {
        Optional<Users> userOptional = usersService.findById(userId);
        Users updated = usersService.updateUser(userId, users);
        userOptional.ifPresent(user -> model.addAttribute("user", user));
        return "edit";
    }

    @DeleteMapping("/user/{userId}/delete")
    public String deleteUser(@PathVariable Long userId, Model model) {
        usersService.deleteUser(userId);
        return "delete";
    }


}
