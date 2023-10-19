package com.givoo.service;

import com.givoo.entity.Users;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface UsersService {
    // 회원가입_Kakao
    Users signUpWithKakao(Users users);

    // 필수정보 입력
    Users updateUserInfo(String token, Users userFirstInfo);

    // 정보찾기
    List<Users> findUserInfo(String token);

    // 회원 탈퇴
    void deleteAppUser(String token);

    List<Users> findAll();

    Users updateUser(Long userId, Users updatedUser);
    void deleteUser(Long userId);

    Optional<Users> findById(Long id);


}
