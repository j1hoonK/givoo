package com.givoo.entity.organization;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity // Entity 클래스임을 명시합니다.
@Table(name = "organization_notice")  //매핑할 테이블 명을 지정합니다.
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
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

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "notice_date", updatable = false)
    private String noticeDate;
    @PrePersist
    protected void onCreate() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
        noticeDate = dateFormat.format(new Date());
    }

    @Column(name ="notice_flag", nullable = false)
    private boolean noticeFlag;

    public OrganizationNotice(String subject, String contents, Long orgId){
        this.subject=subject;
        this.contents=contents;
        this.orgId=orgId;
        this.noticeFlag=false;
    }

}
