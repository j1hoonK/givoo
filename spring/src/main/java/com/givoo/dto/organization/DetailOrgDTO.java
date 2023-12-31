package com.givoo.dto.organization;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class DetailOrgDTO {  // /info/{기관아이디}/{유저아이디}

    private String orgName;  //organization
    private String orgAddress; //organization
    private Double locationLat; //organization
    private Double locationLong; //organization
    private String orgTell; //organization
    private String orgInfo; //organization
    private String orgOwner; //organization
    private String startedUp; //organization
    private String imagePath; //organization
    private String orgType; //organization
    private String orgOwnNumber; //organization
    private Long favId; //favorite
    private String bankName;
    private String accountHolder;
    private String homepage;
    private int favFlag;
}
