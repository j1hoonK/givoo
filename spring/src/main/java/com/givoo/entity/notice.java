package com.givoo.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "app_notice")
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class notice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "notice_id")
    private int noticeId;

    @Column(name = "notice_body", nullable = false)
    private String noticeBody;
}
