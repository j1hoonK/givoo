package com.givoo.entity;

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

    @Column
    private Long orgId;

    @Column
    private Long userId;

    @Column
    private int fav_flag;
        public Favorites(Long orgId, Long userId) {
            this.orgId =orgId;
            this.userId =userId;
            this.fav_flag=1;
        }
}
