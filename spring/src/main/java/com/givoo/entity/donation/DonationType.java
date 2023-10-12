package com.givoo.entity.donation;

import com.givoo.entity.organization.Organization;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity // Entity 클래스임을 명시합니다.
@Table(name = "donation_type")  //매핑할 테이블 명을 지정합니다.
@Getter
@Setter
public class DonationType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "type_id")
    private Long typeId;

    @Column
    private Long orgId;

    @Column(name = "type", nullable = false)
    private String type;

    @Column(name = "default_pay")
    private  String defaultPay;
}
