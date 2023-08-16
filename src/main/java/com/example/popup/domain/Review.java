package com.example.popup.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long reviewId;

    @Column(nullable = false)
    private String image;

    @Column(nullable = false)
    private String content;

    @Column(nullable = false)
    private int reviewCnt;


    public Review(ReviewReqDto reviewReqDto) {

        this.image=reviewReqDto.getImage();
        this.content=reviewReqDto.getContent();
        this.reviewCnt=reviewReqDto.getReviewCnt();
    }
}
