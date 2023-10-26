package com.givoo.entity;

import jakarta.persistence.*;
import lombok.*;

import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "notice")
public class Notice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "notice_id")
    private int noticeId;
    @Column(name = "notice_body", nullable = false)
    private String noticeBody;
    @Column(name = "notice_subject", nullable = false)
    private String noticeSubject;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "notice_date", updatable = false)
    private String noticeDate;
    @PrePersist
    protected void onCreate() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
        noticeDate = dateFormat.format(new Date());
    }


    public Notice(String noticeBody,String noticeSubject){
        this.noticeBody=noticeBody;
        this.noticeSubject=noticeSubject;
    }
}
