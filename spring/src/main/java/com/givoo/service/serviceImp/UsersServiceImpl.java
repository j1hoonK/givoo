package com.givoo.service.serviceImp;

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
        List<Users> address = usersRepository.findByToken(users.getUserAddress());
        System.out.println(findUser);
        if (findUser.isEmpty()) {
            return usersRepository.save(users);
        } else {
            return findUser.get(0);
        }
    }

    @Override
    // 필수정보 입력
    public Users updateUserInfo(String token, Users userFirstInfo) {
        List<Users> usersList = usersRepository.findByToken(token);

        if (!usersList.isEmpty()) {
            Users userinfo = usersList.get(0);
            // 업데이트할 필드 설정
            userinfo.setUserName(userFirstInfo.getUserName());
            userinfo.setUserAddress(userFirstInfo.getUserAddress());
            userinfo.setUserNumberFirst(userFirstInfo.getUserNumberFirst());
            userinfo.setUserBirthday(userFirstInfo.getUserBirthday());

            return usersRepository.save(userinfo);
        } else {
            throw new IllegalArgumentException("토큰을 찾을 수 없습니다.");
        }
    }

    @Override
    // 정보찾기
    public List<Users> findUserInfo(String token){
        return usersRepository.findByToken(token);
    }
}
