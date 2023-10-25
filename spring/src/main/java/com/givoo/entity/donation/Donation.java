package com.givoo.entity.donation;

import com.givoo.entity.Users;
import com.givoo.entity.organization.Organization;
import jakarta.persistence.*;
import lombok.*;

import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Table(name = "donation")
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "dnt_id")
    private Long dntId;

    @Column(name = "dnt_amount", nullable = false)
    private int dntAmount;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "dnt_date", updatable = false)
    private String dntDate;
    @PrePersist
    protected void onCreate() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
        dntDate = dateFormat.format(new Date());
    }


    @Column(name = "receipt_result", nullable = false, columnDefinition = "varchar(45) default '진행중'")
    private String receiptResult;

    @Column
    private Long orgId;

    @Column
    private Long userId;

    @Column(name = "type_payment")
    private String typePayment;

    @Column(name = "dnt_comment")
    private String dntComment;

    @Column(name = "is_regulation", nullable = false, columnDefinition = "varchar(45) default 'False'")
    private String isRegulation;

    @Column(name = "dnt_comment_regulation")
    private String dntCommentRegulation;

    @Column(name = "dnt_type")
    private String dntType;
    @Column(nullable = false)
    private String orgName;
    public Donation(Long userId,Long orgId, int dntAmount,String orgName) {
        this.userId=userId;
        this.orgId=orgId;
        this.dntAmount=dntAmount;
        this.isRegulation="0";
        this.receiptResult="처리중";
        this.orgName=orgName;
    }
}
