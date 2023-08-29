package com.givoo.dto.organization;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Date;

@Getter
@AllArgsConstructor
public class DetailOrgDTO {  // /info?{기관아이디}&{유저아이디}

    private String orgName;  //organization
    private String orgAddress; //organization
    private Long locationLat; //organization
    private Long locationLong; //organization
    private Long orgTell; //organization
    private String orgInfo; //organization
    private String orgOwner; //organization
    private Date startedUp; //organization
    private String imagePath; //organization
    private String favId; //favorite
}
