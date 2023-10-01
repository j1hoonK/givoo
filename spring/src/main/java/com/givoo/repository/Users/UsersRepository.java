package com.givoo.repository.Users;

import com.givoo.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UsersRepository extends JpaRepository <Users,Long> {
    // 회원가입
    List<Users> findByToken(String token);




}
