package com.example.popup.controller;

import com.example.popup.dto.ResDto.GlobalResDto;
import com.example.popup.service.MyPageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/mypage")
public class MyPageController {

    private final MyPageService myPageService;

    @GetMapping("/savePopup")
    public GlobalResDto<?> getAllSavePopup() {

        return myPageService.getAllSavePopup();
    }

    @GetMapping("/savePopup/delete/{popupId}")
    public GlobalResDto<?> getDeletePopup(@PathVariable Long popupId) {

        return myPageService.getDeletePopup(popupId);
    }
}
