package baro.baro.Entity;

import baro.baro.dto.OrganizationDto;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.beans.BeanUtils;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.util.Date;

@Entity
@Getter
@Setter
@AllArgsConstructor
@EntityListeners(AuditingEntityListener.class)
@Table (name = "organization")  // 테이블 생성시 이름을 지정해줌

public class Organization {
    @Id @GeneratedValue
    private Long org_id;
    private String org_number;
    private String org_name;
    private String org_adress;
    private double location_lat;
    private double location_long;
    private String org_tell;
    private String org_type;
    private String org_info;
    private String org_owner;
    private Date started_up;

    public Organization() {}

    public static OrganizationDto jpoOf(Organization organization) {
        OrganizationDto organizationDto = new OrganizationDto();
        BeanUtils.copyProperties(organization, organizationDto);
        return organizationDto;
    }
}
