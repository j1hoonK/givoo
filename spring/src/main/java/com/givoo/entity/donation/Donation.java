package com.givoo.entity.donation;

import com.givoo.dto.donation.DonationDTO;
import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Entity // Entity 클래스임을 명시합니다.
@Table(name = "donation")  //매핑할 테이블 명을 지정합니다.
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Donation {
    @Id //pk 값
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // 자동 증가
    @Column(nullable = false)   // null 값 허용 x 기본값 true
    private Long dntId;
    @Column(nullable = false)
    private Long dntAmount;
    @Column(nullable = false)
    private Date dntDate;
    @Column(nullable = false, columnDefinition = "처리중")
    private String receiptResult;
    private Long orgId;
    @Column(nullable = false)
    private Long userId;
    @Column(nullable = false)
    private String typePayment;
    private String dntComment;  //null 값 허용되는 컬럼
    @Column(nullable = false)
    private String isRegulation;
    private String dntCommentRegulation; //null 값 허용되는 컬럼
    @Column(nullable = false)
    private String dntType;

//    public DonationDTO converter(String orgName) {
//        return new DonationDTO(
//                this.dntId, this.dntAmount, this.dntDate, this.receiptResult, this.orgId, this.userId,
//                this.typePayment, this.dntComment, this.isRegulation, this.dntCommentRegulation,
//                this.dntType, orgName
//        );
//    }
}
