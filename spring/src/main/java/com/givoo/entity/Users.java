package com.givoo.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "users")
@Getter
@Setter
public class Users {
    @Id //pk 값
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // 자동 증가
    private int userId;
    @Column(nullable = false)
    private String userName;
    @Column(nullable = false)
    private String userEmail;
    @Column
    private Long userTell;
    @Column
    private String userAddress;
    @Column
    private String userNname;
    @Column
    private String userImage;
    @Column(nullable = false)
    private String loginType;
    @Column
    private String token;
}
