package com.givoo.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Date;

@Getter
@AllArgsConstructor
public class MainPageDTO {  // '/'


    private String orgName;     //organization
    private String imagePath;   //organization
    private String fndrTitle;   //fundraising
    private String fndrInfo;    //fundraising
    private Long goal;          //fundraising
    private Long current;       //fundraising
    private Date fndrDeadLine;  //fundraising
    private Long favId;  //favorite
}
