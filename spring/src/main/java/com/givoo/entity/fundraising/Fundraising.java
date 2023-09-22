package com.givoo.entity.fundraising;

import com.givoo.entity.organization.Organization;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Entity
@Table(name = "fundraising")
@Getter
@Setter
public class Fundraising {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "fndr_id")
    private Long fndrId;

    @Column(name = "fndr_title", nullable = false)
    private String fndrTitle;

    @Column(name = "fndr_info", nullable = false)
    private String fndrInfo;

    @Column(name = "goal", nullable = false)
    private Long goal;

    @Column(name = "current", nullable = false)
    private Long current;

    @Column(name = "fndr_deadline", nullable = false)
    private Date fndrDeadline;

    @ManyToOne
    @JoinColumn(name = "org_id", nullable = false)
    private Organization organization;

    @Column(name = "account_fndr", nullable = false)
    private Long accountFndr;

    @Column(name = "use_main_account", nullable = false, columnDefinition = "varchar(45) default 'True'")
    private String useMainAccount;
}