package com.example.popup.controller;

import com.example.popup.domain.Review;
import com.example.popup.dto.ReqDto.ReviewReqDto;
import com.example.popup.service.ReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RequiredArgsConstructor
@RestController
public class ReviewController {

    private final ReviewService reviewService;

    @PostMapping("review/save")
    public Review getSave(@RequestBody ReviewReqDto reviewReqDto) {


        return reviewService.getSave(reviewReqDto);
    }
}
