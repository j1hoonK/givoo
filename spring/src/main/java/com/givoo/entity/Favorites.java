package com.givoo.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity // Entity 클래스임을 명시합니다.
@Table(name = "favorites")  //매핑할 테이블 명을 지정합니다.
@Getter
@Setter
@ToString
public class Favorites {
    @Id //pk 값
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // 자동 증가
    private Long favId;
    @Column(nullable = false)
    private Long orgId;
    @Column(nullable = false)
    private Long userId;

    public Favorites(Long orgId, Long userId) {
    }

    public Favorites() {

    }
}
