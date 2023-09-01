package com.givoo.donation.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "donation")
public class DonationEntity {
    @Id //pk 값
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // 자동 증가
    @Column(nullable = false)   // null 값 허용 x 기본값 true
    private Long dntId;
    @Column(nullable = false)
    private Long dntAmount;
    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date dntDate;
    @Column(nullable = false, length = 45, columnDefinition = "varchar(45) default '대기중'")
    private String receiptResult;
    @Column(nullable = false)
    private Long orgId;
    private Long userId;
    @Column(nullable = false)
    private String typePayment;

    private String dntComment;  //null 값 허용되는 컬럼
    @Column(nullable = false)
    private String isRegulation;

    private String dntCommentRegulation; //null 값 허용되는 컬럼
    @Column(nullable = false)
    private String dntType;
}
