package com.givoo.dto.organization;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class SearchOrgDTO {
    private String orgName;
    private String imagePath;
    private String orgAddress;
}
