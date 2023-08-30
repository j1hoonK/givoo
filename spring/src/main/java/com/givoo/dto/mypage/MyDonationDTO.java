package com.givoo.dto.mypage;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Date;

@Getter
@AllArgsConstructor
public class MyDonationDTO { // /mypage/dntresult{userid}
    private Long orgId; //donation
    private Date dntDate; //donation
    private Long dntAmount; //donation
    private String isRegulation; //donation
}
