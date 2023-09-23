package com.givoo.entity.fundraising;

import com.givoo.entity.Users;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "fundraising_join_list")
@Getter
@Setter
public class FundraisingJoinList {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "fndr_join_id")
    private Long fndrJoinId;

    @Column
    private Long fundraising;

    @Column
    private Long users;
}
