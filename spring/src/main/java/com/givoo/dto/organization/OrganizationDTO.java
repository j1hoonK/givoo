package com.givoo.dto.organization;


import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Date;

@AllArgsConstructor
@Getter
public class OrganizationDTO {

    private Long orgId; //organization
    private String orgNumber; //organization
    private String orgName; //organization
    private String orgAddress; //organization
    private Long locationLat; //organization
    private Long locationLong; //organization
    private String orgTell; //organization
    private String orgType; //organization
    private String orgInfo; //organization
    private String orgOwner; //organization
    private Date startedUp; //organization


}
