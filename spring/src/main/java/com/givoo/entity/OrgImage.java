package com.givoo.entity;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Getter
@Setter
@EntityListeners(AuditingEntityListener.class)
@Table(name = "org_image")  // 테이블 생성시 이름을 지정해줌
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class OrgImage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private String originName;
    private String saveName;
    private String extension;
    private String savePath;
    private Long orgId;
    private String imageType;
}
