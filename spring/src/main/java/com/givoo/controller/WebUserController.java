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
