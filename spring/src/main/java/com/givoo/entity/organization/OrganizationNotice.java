package com.givoo.entity.organization;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Entity // Entity클래스임을 명시합니다.
@Table(name = "organization_notice")  //매핑할 테이블 명을 지정합니다.
@Getter
@Setter
public class OrganizationNotice {
    @Id //pk 값
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // 자동 증가
    private Long noticeId;
    @Column(nullable = false)
    private String subject;
    @Column(nullable = false)
    private Long orgId;
    @Column(nullable = false)
    private String contents;
    @Column(nullable = false)
    private Date noticeDate;
}
