package com.givoo.entity.donation;

import com.givoo.entity.Users;
import com.givoo.entity.organization.Organization;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Entity
@Table(name = "donation")
@Getter
@Setter
@ToString
@AllArgsConstructor
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "dnt_id")
    private Long dntId;

    @Column(name = "dnt_amount", nullable = false)
    private Long dntAmount;

    @Column(name = "dnt_date", nullable = false)
    private Date dntDate;

    @Column(name = "receipt_result", nullable = false, columnDefinition = "varchar(45) default '진행중'")
    private String receiptResult;

    @Column
    private Long orgId;

    @Column
    private Long userId;

    @Column(name = "type_payment", nullable = false)
    private String typePayment;

    @Column(name = "dnt_comment")
    private String dntComment;

    @Column(name = "is_regulation", nullable = false, columnDefinition = "varchar(45) default 'False'")
    private String isRegulation;

    @Column(name = "dnt_comment_regulation")
    private String dntCommentRegulation;

    @Column(name = "dnt_type", nullable = false)
    private String dntType;

    public Donation() {

    }
}
