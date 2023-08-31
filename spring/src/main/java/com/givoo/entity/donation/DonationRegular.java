package com.givoo.entity.donation;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Entity // Entity 클래스임을 명시합니다.
@Table(name = "donation_regular")  //매핑할 테이블 명을 지정합니다.
@Getter
@Setter
public class DonationRegular {
    @Id //pk 값
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // 자동 증가
    private Long dntRegularId;
    @Column(nullable = false)
    private Long userId;
    @Column(nullable = false)
    private Long orgId;
    @Column(nullable = false)
    private String isusenow;
    @Column(nullable = false)
    private Date started;

    private Long amountDntRegular; //null 허용 컬럼
    @Column(nullable = false)
    private Date paymentDate;
    @Column(nullable = false)
    private Long period;
    @Column(nullable = false)
    private Long periodDetail;

}
