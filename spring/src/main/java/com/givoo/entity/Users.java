package com.givoo.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity // Entity 클래스임을 명시합니다.
@Table(name = "users")  //매핑할 테이블 명을 지정합니다.
@Getter
@Setter
public class Users {
    @Id //pk 값
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // 자동 증가
    private Long userId;
    @Column(nullable = false)
    private String userName;
    @Column(nullable = false)
    private String userEmail;
    @Column(nullable = false)
    private Long userTell;
    @Column(nullable = false)
    private String userAddress;
    private String userNname;  //null 허용
}
