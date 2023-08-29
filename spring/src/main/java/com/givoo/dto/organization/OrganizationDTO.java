package com.givoo.dto.organization;


import com.givoo.entity.organization.Organization;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.beans.BeanUtils;

import java.util.Date;

@AllArgsConstructor
@Getter
@NoArgsConstructor
public class OrganizationDTO {
    private Long org_id;
    private String org_number;
    private String org_name;
    private String org_address;
    private double location_lat;
    private double location_long;
    private String org_tell;
    private String org_type;
    private String org_info;
    private String org_owner;
    private Date started_up;


    public Organization asJpo() {
        Organization Organization = new Organization();
        BeanUtils.copyProperties(this, Organization);
        return Organization;
    }
}
