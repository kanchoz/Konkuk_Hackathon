package com.example.popup.dto.ReqDto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Column;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ReviewReqDto {

    @Column(nullable = false)
    private String image;

    @Column(nullable = false)
    private String content;

}
