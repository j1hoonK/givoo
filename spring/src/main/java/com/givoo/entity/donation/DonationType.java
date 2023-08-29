package com.givoo.entity.donation;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity // Entity클래스임을 명시합니다.
@Table(name = "donation_type")  //매핑할 테이블 명을 지정합니다.
@Getter
@Setter
public class DonationType {
    @Id //pk 값
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // 자동 증가
    private Long typeId;
    @Column(nullable = false)
    private Long orgId;
    @Column(nullable = false)
    private String type;
}
