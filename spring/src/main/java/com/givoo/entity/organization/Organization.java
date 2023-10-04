package com.givoo.entity.organization;

import com.givoo.dto.organization.DetailOrgDTO;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.util.Date;

@Entity
@Getter
@Setter
@EntityListeners(AuditingEntityListener.class)
@Table (name = "organization")  // 테이블 생성시 이름을 지정해줌
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Organization {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "org_id")
    private Long orgId;

    @Column(name = "org_name", nullable = false)
    private String orgName;

    @Column(name = "org_ownnumber")
    private String orgOwnNumber;

    @Column(name = "org_number", nullable = false)
    private Long orgNumber;

    @Column(name = "org_address", nullable = false)
    private String orgAddress;

    @Column(name = "zip")
    private Long zip;

    @Column(name = "location_lat", nullable = false)
    private Double locationLat;

    @Column(name = "location_long", nullable = false)
    private Double locationLong;

    @Column(name = "org_tell", nullable = false)
    private String orgTell;

    @Column(name = "org_type", nullable = false)
    private String orgType;

    @Column(name = "org_info")
    private String orgInfo;

    @Column(name = "org_notice")
    private String orgNotice;

    @Column(name = "org_owner", nullable = false)
    private String orgOwner;

    @Column(name = "started_up", nullable = false)
    private String startedUp;

    @Column(name = "account_number")
    private String accountNumber;
    @Column(name="bank_name")
    private String bankName;
    @Column(name="account_holder")
    private String accountHolder;
    @Column(name = "image_path")
    private String imagePath;
    @Column(name = "hompage")
    private String hompage;

    @Column(name = "total_favorite", nullable = false)
    private Long totalFavorite;

    public DetailOrgDTO converter(Long favId,int favFlag){
        return new DetailOrgDTO(
                this.orgName,this.orgAddress,this.locationLat,this.locationLong,
                this.orgTell,this.orgInfo,this.orgOwner,this.startedUp,
                this.imagePath,this.orgType,this.orgOwnNumber,favId,this.bankName,this.accountHolder,this.hompage,favFlag
        );
    }


}
