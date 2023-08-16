package com.example.popup.service;

import com.example.popup.domain.Popup;
import com.example.popup.domain.Review;
import com.example.popup.dto.ReqDto.ReviewReqDto;
import com.example.popup.repository.ReviewRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@RequiredArgsConstructor
public class ReviewService {

    private final ReviewRepository reviewRepository;

    @Transactional

    public Review getSave(ReviewReqDto reviewReqDto) {

        Review review = new Review(reviewReqDto);
        reviewRepository.save(review);

        return review;
    }
}
