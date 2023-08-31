package com.givoo.entity.fundraising;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity // Entity 클래스임을 명시합니다.
@Table(name = "fundraising_interest")  //매핑할 테이블 명을 지정합니다.
@Getter
@Setter
public class FundraisingInterest {
    @Id //pk 값
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // 자동 증가
    private Long fndrIntrId;
    @Column(nullable = false)
    private Long FndrId;
    @Column(nullable = false)
    private Long userId;

}
