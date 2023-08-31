package com.givoo.dto.mypage;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Date;

@Getter
@AllArgsConstructor

public class MyDonationDetailDTO { // /mypage/dntresult?{userid}&{dntid}
    private Long orgId; //donation
    private Date dntDate; //donation
    private Long dntAmount; //donation
    private String isRegulation; //donation
    private String receiptResult; //donation
    private String typePayment; //donation
    private String dntComment; //donation
    private String dntCommentRegulation; //donation
    private String dntType; //donation
}
