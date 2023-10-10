package com.givoo.service.serviceImp;

import com.givoo.entity.Users;
import com.givoo.repository.Users.UsersRepository;
import com.givoo.service.UsersService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

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
            userinfo.setUserNumberSecond(userFirstInfo.getUserNumberSecond());
            userinfo.setBirthdayMonth(userFirstInfo.getBirthdayMonth());
            userinfo.setBirthdayDay(userFirstInfo.getBirthdayDay());

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

    @Override
    public void deleteUser(String token) {

    }

    @Override
    //웹 모든 정보 찾기
    public List<Users> findAll() {
        return usersRepository.findAll();
    }

    @Override
    public Users updateUser(Long userId, Users updatedUser) {
        Users existingUser = usersRepository.findById(userId)
                .orElseThrow(() -> new UsernameNotFoundException("사용자 정보를 찾을 수 없습니다. " + userId));

        // Update user properties
        existingUser.setUserName(updatedUser.getUserName());
        existingUser.setUserEmail(updatedUser.getUserEmail());
        existingUser.setUserTell(updatedUser.getUserTell());
        existingUser.setUserAddress(updatedUser.getUserAddress());
        existingUser.setUserNumberFirst(updatedUser.getUserNumberFirst());
        existingUser.setUserNumberSecond(updatedUser.getUserNumberSecond());

        return usersRepository.save(existingUser);
    }

    @Override
    public void deleteUser(Long userId) {
        usersRepository.deleteById(userId);
    }

    @Override
    public Optional<Users> findById(Long id) {
        return usersRepository.findById(id);
    }


}
