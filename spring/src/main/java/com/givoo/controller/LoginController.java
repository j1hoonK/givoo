package com.givoo.controller;

import com.givoo.entity.Users;
import com.givoo.service.UsersService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name = "Login", description = "App SNS로그인 관련 API")
@RestController
@RequestMapping("/login")
public class LoginController {
    private final UsersService usersService;
    @Autowired
    public LoginController(UsersService usersService) {
        this.usersService = usersService;
    }

    @PostMapping("/kakao/{token}")
    @Operation(summary = "회원가입_Kakao", description = "Token으로 가입여부 확인 후, 회원가입 처리")
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
    @Operation(summary = "사용자 정보 조회", description = "Token으로 사용자 정보 조회")
    public List<Users> findUserInfo(@PathVariable("token") String token){
        System.out.println(token);
        return usersService.findUserInfo(token);
    }
}
