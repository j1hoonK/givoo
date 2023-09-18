package com.givoo.entity.fundraising;

import com.givoo.entity.Users;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "fundraising_Longerest")
@Getter
@Setter
public class FundraisingLongerest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "fndr_Longr_id")
    private Long fndrLongrId;

    @ManyToOne
    @JoinColumn(name = "fndr_id", nullable = false)
    private Fundraising fundraising;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private Users users;
}
