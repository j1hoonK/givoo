package com.givoo.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity // Entity 클래스임을 명시합니다.
@Table(name = "app_qna")  //매핑할 테이블 명을 지정합니다.
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class qna {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "qna_id")
    private int qnaId;

    @Column(name = "question", nullable = false)
    private String question;

    @Column(name = "answer", nullable = false)
    private String answer;
}