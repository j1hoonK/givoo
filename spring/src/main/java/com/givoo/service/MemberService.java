package com.givoo.service;

import com.givoo.entity.Member;
import com.givoo.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

@Service
@Transactional
@RequiredArgsConstructor
public class MemberService  implements UserDetailsService{

    private final MemberRepository memberRepository;

    public Member saveMember(Member member){
        validateDuplicateMember(member.getUsername());//이미 가입한 회원이면 오류 발생 저장안됨.
        System.out.println("성공@@@@@@@@@@");
        return memberRepository.save(member);//새로운 username이면 저장.
    }

    public boolean validateDuplicateMember(String username){
        Member findMember = memberRepository.findByUsername(username);
        if(findMember !=null)
            return true;
        return false;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Member member = memberRepository.findByUsername(username);
        if(member==null) throw new UsernameNotFoundException(username);

        return User.builder()
                .username(member.getUsername())
                .password(member.getPassword())
                .roles(member.getRole().toString())
                .build();
    }
}