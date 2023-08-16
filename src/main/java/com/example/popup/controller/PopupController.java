package com.example.popup.controller;

import com.example.popup.domain.Popup;
import com.example.popup.dto.ReqDto.PopupReqDto;
import com.example.popup.service.PopupService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RequiredArgsConstructor
@RestController
public class PopupController {

    private final PopupService popupService;

    @PostMapping("/popup/save")
    public Popup getSave(@RequestBody PopupReqDto popupReqDto){


        return popupService.getSave(popupReqDto);
    }
}
