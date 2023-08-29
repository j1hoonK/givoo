package com.givoo.dto.donation;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Date;

@Getter
@AllArgsConstructor
public class DonationRegulationDTO {
    private Long orgId;
    private String isusenow;
    private Date started;
    private Long amountDntRegular;
    private Date paymentDate;

}
