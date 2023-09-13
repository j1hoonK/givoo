package com.givoo.service.serviceImp.AppLogin;

import com.givoo.entity.Users;
import com.givoo.repository.Users.UsersRepository;
import com.givoo.service.UsersService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {
    private final UsersRepository usersRepository;

    public UsersServiceImpl(UsersRepository usersRepository) {
        this.usersRepository = usersRepository;
    }

    @Override
    // 회원가입
    public Users signUpWithKakao(Users users) {
        List<Users> findUser = usersRepository.findByToken(users.getToken());
        System.out.println(findUser);
        if (findUser.isEmpty()) {
            return usersRepository.save(users);
        } else {
            return (Users) findUser;
        }
    }

    @Override
    // 정보찾기
    public List<Users> findUserInfo(String token){
        return usersRepository.findByToken(token);
    }
}
