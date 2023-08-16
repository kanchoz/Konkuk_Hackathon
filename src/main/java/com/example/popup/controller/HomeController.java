package com.example.popup.controller;

import com.example.popup.dto.ResDto.GlobalResDto;
import com.example.popup.service.HomeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/home")
public class HomeController {

    private final HomeService homeService;


    @GetMapping("/hotPopup")
    public GlobalResDto<?> getHotPopup() {

        return homeService.getHotPopup();
    }

    @GetMapping("/allPopup")
    public GlobalResDto<?> getAllPopup() throws IOException {

        return homeService.getAllPopup();
    }
}
