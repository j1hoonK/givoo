package com.givoo.dto.donation;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Date;

@Getter
@AllArgsConstructor
public class DonationRegulationDTO { // /mypage/dntregul/{userid}
    private Long orgId;  //donation_regular
    private String isusenow; //donation_regular
    private Date started; //donation_regular
    private Long amountDntRegular; //donation_regular
    private Date paymentDate; //donation_regular

}
