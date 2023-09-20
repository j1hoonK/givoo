package com.givoo.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "users")
@Getter
@Setter
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private int userId;

    @Column(name = "user_name", nullable = false)
    private String userName;

    @Column(name = "user_email", nullable = false)
    private String userEmail;

    @Column(name = "user_tell")
    private Long userTell;

    @Column(name = "user_address")
    private String userAddress;

    @Column(name = "user_nname")
    private String userNname;

    @Column(name = "user_number_first")
    private Integer userNumberFirst;

    @Column(name = "user_number_second")
    private Integer userNumberSecond;

    @Column(name = "token", nullable = false)
    private String token;
  
    @Column(name = "user_image")
    private String userImage;
  
    @Column(name = "login_type", nullable = false)
    private String loginType;
}
