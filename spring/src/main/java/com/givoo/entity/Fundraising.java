package com.givoo.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Entity // Entity클래스임을 명시합니다.
@Table(name = "fundraising")  //매핑할 테이블 명을 지정합니다.
@Getter
@Setter
public class Fundraising {
    @Id //pk 값
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // 자동 증가
    private Long fndrId;
    @Column(nullable = false)
    private String fndrTitle;
    @Column(nullable = false)
    private String fndrInfo;
    @Column(nullable = false)
    private Long goal;
    @Column(nullable = false)
    private Long current;
    @Column(nullable = false)
    private Date fndrDeadline;
    @Column(nullable = false)
    private Long orgId;
    @Column(nullable = false)
    private Long accountFndr;
    @Column(nullable = false)
    private String useMainAccount;

}
