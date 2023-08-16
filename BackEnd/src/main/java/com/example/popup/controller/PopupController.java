package com.example.popup.controller;

import com.example.popup.domain.Popup;
import com.example.popup.dto.ReqDto.BookMarkReqDto;
import com.example.popup.dto.ReqDto.PopupReqDto;
import com.example.popup.dto.ResDto.GlobalResDto;
import com.example.popup.service.PopupService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/popup")
public class PopupController {

    private final PopupService popupService;

    @PostMapping("/save")
    public Popup getSave(@RequestBody PopupReqDto popupReqDto) {


        return popupService.getSave(popupReqDto);
    }

    @GetMapping("/{popupId}")
    public GlobalResDto<?> getOnePopup(@PathVariable Long popupId) {

        return popupService.getOnePopup(popupId);
    }

    @PostMapping("/{popupId}")
    public GlobalResDto<?> bookmarkPopup(@PathVariable Long popupId, @RequestBody BookMarkReqDto bookMarkReqDto) {

        return popupService.bookmarkPopup(popupId, bookMarkReqDto);
    }
}
