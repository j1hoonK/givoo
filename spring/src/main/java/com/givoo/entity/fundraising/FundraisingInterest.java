package com.givoo.entity.fundraising;

import com.givoo.entity.Users;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "fundraising_interest")
@Getter
@Setter
public class FundraisingInterest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "fndr_intr_id")
    private Long fndrIntrId;

    @Column
    private Long fundraising;

    @Column
    private Long users;
}
