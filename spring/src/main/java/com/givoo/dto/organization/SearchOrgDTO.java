package com.givoo.dto.organization;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class SearchOrgDTO { //search?{기관명}


    private String orgName; //organization
    private String imagePath; //organization
    private String orgAddress; //organization
}
