package com.givoo.dto.donation;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class DonationDTO {  // /donation?{기관id}&{userId}

    private Long orgId; //donation
    private Long typeId; //donation

}
