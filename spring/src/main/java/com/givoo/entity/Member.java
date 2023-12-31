package com.givoo.entity;

import com.givoo.constant.Role;
import com.givoo.dto.MemberFormDTO;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.crypto.password.PasswordEncoder;

@Entity
@Table(name="member")
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Member {
    @Id
    @Column(name="member_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(unique = true)
    private String username;
    private String password;

    @Enumerated(EnumType.STRING)
    private Role role;

    public Member(String username, String password, Role role) {
        this.username =username;
        this.password =password;
        this.role = role;
    }


    public static Member createMember(MemberFormDTO memberFormDto, PasswordEncoder passwordEncoder){

        Member member = new Member();
        member.setUsername(memberFormDto.getUsername());
        String password = passwordEncoder.encode(memberFormDto.getPassword());//
        member.setPassword(password);
        member.setRole(Role.USER);
        return member;
    }

    public static Member createAdminMember(MemberFormDTO memberFormDto, PasswordEncoder passwordEncoder){

        Member member = new Member();
        member.setUsername(memberFormDto.getUsername());
        String password = passwordEncoder.encode(memberFormDto.getPassword());//
        member.setPassword(password);
        member.setRole(Role.ADMIN);
        return member;
    }

}

