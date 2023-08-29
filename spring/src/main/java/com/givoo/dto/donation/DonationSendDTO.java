package com.givoo.dto.donation;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Date;

@Getter
@AllArgsConstructor
public class DonationSendDTO {
    private Long orgId;  //donation
    private Long userId; //donation
    private String dntType; //donation
    private Long dntAmount; //donation
    private String typePayment; //donation
    private String dntComment; //donation
    private Date dntDate; //donation
}
