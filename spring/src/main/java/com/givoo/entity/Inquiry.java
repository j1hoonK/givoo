package com.givoo.entity;

import jakarta.persistence.*;
import lombok.*;

import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Table(name = "inquiry")
public class Inquiry {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "inquiry_id")
    private Long inquiryId;

    @Column(name = "title", nullable = false)
    private String title;

    @Lob
    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "category")
    private String category;

    @Column
    private Long userId;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at", updatable = false)
    private String createdAt;
    @PrePersist
    protected void onCreate() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
        createdAt = dateFormat.format(new Date());
    }

    @Column(name = "status")
    private String status;

    @Column(name ="answer")
    private String answer;
    @Column(name="answer_created")
    private String answerCreated;
    public Inquiry(Long userId, String title, String content) {
        this.userId =userId;
        this.title =title;
        this.content=content;
        this.status="0";
    }

}