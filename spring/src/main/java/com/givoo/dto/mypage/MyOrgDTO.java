package com.givoo.dto.mypage;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class MyOrgDTO { // /mypage/org/{userid}
    private String orgName; //donation
    private String imagePath; //donation
    private String orgType; //donation
    private Long orgId; //donation
}
