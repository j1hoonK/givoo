package com.givoo.service;

import com.givoo.entity.Users;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UsersService {
    // 회원가입_Kakao
    Users signUpWithKakao(Users users);

    // 정보찾기
    List<Users> findUserInfo(String token);
}
