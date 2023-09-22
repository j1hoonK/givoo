package com.givoo.dto.organization;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Date;

@Getter
@AllArgsConstructor
public class DetailOrgDTO {  // /info/{기관아이디}/{유저아이디}

    private Long orgId; //organization
    private String orgNumber;
    private String orgName;
    private String orgAddress;
    private Long locationLat;
    private Long locationLong;
    private Long orgTell;
    private String orgType;
    private String orgInfo;
    private String orgOwner;
    private Date startedUp;
    private Long accountNumber;
    private String imagePath;
    private Long favId; //favorite]
}
