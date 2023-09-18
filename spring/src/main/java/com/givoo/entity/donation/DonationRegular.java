package com.givoo.entity.donation;

import com.givoo.entity.Users;
import com.givoo.entity.organization.Organization;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Entity
@Table(name = "donation_regular")
@Getter
@Setter
public class DonationRegular {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "dnt_regular_id")
    private Long dntRegularId;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private Users userId;

    @ManyToOne
    @JoinColumn(name = "org_id", nullable = false)
    private Organization orgId;

    @Column(name = "isusenow", nullable = false)
    private String isusenow;

    @Column(name = "started", nullable = false)
    private Date started;

    @Column(name = "amount_dnt_regular")
    private Long amountDntRegular;

    @Column(name = "payment_date", nullable = false)
    private Date paymentDate;

    @Column(name = "period", nullable = false)
    private Long period;

    @Column(name = "period_detail", nullable = false)
    private Long periodDetail;
}