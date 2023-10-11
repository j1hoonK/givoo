package com.givoo.entity.organization;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;
import java.util.Date;

@Entity // Entity 클래스임을 명시합니다.
@Table(name = "organization_notice")  //매핑할 테이블 명을 지정합니다.
@Getter
@Setter
public class OrganizationNotice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "notice_id")
    private Long noticeId;

    @Column(name = "subject", nullable = false)
    private String subject;

    @Column
    private Long orgId;

    @Column(name = "contents", nullable = false)
    private String contents;

    @Column(name = "notice_date", nullable = false)
    private Timestamp noticeDate;
    @Column(name ="notice_flag", nullable = false)
    private Boolean noticeFlag;
}
