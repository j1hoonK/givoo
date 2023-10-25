package com.givoo.dto.donation;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Date;

@Getter
@AllArgsConstructor
public class DonationDTO {  // /donation/{기관id}/{userId}

    private Long dntId;
    private Long dntAmount;
    private Date dntDate;
    private String receiptResult;
    private Long orgId;
    private Long userId;
    private String typePayment;
    private String dntComment;  //null 값 허용되는 컬럼
    private String isRegulation;
    private String dntCommentRegulation; //null 값 허용되는 컬럼
    private String dntType;
    private String orgName;
}
