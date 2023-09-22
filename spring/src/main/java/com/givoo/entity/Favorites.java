package com.givoo.entity;

import com.givoo.entity.organization.Organization;
import jakarta.persistence.*;
import lombok.*;

@Entity // Entity 클래스임을 명시합니다.
@Table(name = "favorites")  //매핑할 테이블 명을 지정합니다.
@Getter
@Setter
@ToString
@NoArgsConstructor

public class Favorites {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "fav_id")
    private Long favId;

    @ManyToOne
    @JoinColumn(name = "org_id", nullable = false)
    private Organization orgId;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private Users userId;

    public Favorites(Organization orgId, Users userId) {
        this.orgId =orgId;
        this.userId =userId;
    }
}
