package com.givoo.donation.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "donation_type")
public class DonationTypeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "type_id")
    private Long typeId;
    @Column(nullable = false, name = "org_id")
    private Long orgId;
    @Column(nullable = false)
    private String type;
}
