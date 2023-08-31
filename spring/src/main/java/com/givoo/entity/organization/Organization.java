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
public class Organization {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // 자동 증가
    private Long orgId;
    @Column(nullable = false)
    private String orgNumber;
    @Column(nullable = false)
    private String orgName;
    @Column(nullable = false)
    private String orgAddress;
    @Column(nullable = false)
    private Long locationLat;
    @Column(nullable = false)
    private Long locationLong;
    @Column(nullable = false)
    private Long orgTell;
    @Column(nullable = false)
    private String orgType;
    @Column(nullable = false)
    private String orgInfo;
    @Column(nullable = false)
    private String orgOwner;
    @Column(nullable = false)
    private Date startedUp;

    private Long accountNumber; //null 허용
    @Column(nullable = false)
    private String imagePath;
    @Column(nullable = false)
    private Long totalFavorite;
    public DetailOrgDTO converter(Long favId){
        return new DetailOrgDTO(
                this.orgName,this.orgAddress,this.getLocationLat(),this.getLocationLong(),
                this.getOrgTell(),this.getOrgInfo(),this.getOrgOwner(),this.getStartedUp(),
                this.getImagePath(),favId
        );
    }


    }

