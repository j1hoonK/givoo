//package com.givoo.service;
//
//import com.givoo.entity.Manager;
//import lombok.RequiredArgsConstructor;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//@Service
//@Transactional
//@RequiredArgsConstructor
//public class MenagerService implements UserDetailsService {
//
//    private final MenagerRepository menagerRepository;
//
//    public Menager saveMember(Menager member){
//        validateDuplicateMember(member);//이미 가입한 회원이면 오류 발생 저장안됨.
//        return menagerRepository.save(member);//새로운 이메일번호면 저장.
//    }
//
//    private void validateDuplicateMember(Menager member){
//        Menager findMember = menagerRepository.findByEmail(member.getEmail());
//        if(findMember !=null)
//            throw new IllegalStateException("이미 가입된 회원입니다.");
//    }
//
//    @Override
//    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
//        Menager member = menagerRepository.findByEmail(email);
//        if(member==null) throw new UsernameNotFoundException(email);
//
//        return User.builder()
//                .password(member.getPassword())
//                .build();
//    }
//}