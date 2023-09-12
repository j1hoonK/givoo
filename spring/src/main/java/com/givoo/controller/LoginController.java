package com.givoo.controller;

import com.givoo.entity.Users;
import com.givoo.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/login")
public class LoginController {
    private final UsersService usersService;
    @Autowired
    public LoginController(UsersService usersService) {
        this.usersService = usersService;
    }

    @PostMapping("/kakao/{token}")
    public ResponseEntity<String> signUpWithKakao(@PathVariable String token, @RequestBody Users kakaoUserData){
        kakaoUserData.setToken(token);
        Users kakaoSignUp = usersService.signUpWithKakao(kakaoUserData);
        if(kakaoSignUp != null){
            return ResponseEntity.ok("OK: User is already in UserList");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("NG: Error saving user.");
        }
    }

    @GetMapping("/{token}")
    public List<Users> findUserInfo(@PathVariable("token") String token){
        System.out.println(token);
        return usersService.findUserInfo(token);
    }
}
