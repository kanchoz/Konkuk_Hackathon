package com.example.popup.controller;

import com.example.popup.dto.ReqDto.PopupReqDto;
import com.example.popup.dto.ReqDto.SearchReqDto;
import com.example.popup.dto.ResDto.GlobalResDto;
import com.example.popup.service.SearchService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RequiredArgsConstructor
@RestController
public class SearchController {

    private final SearchService searchService;

    @PostMapping("/search")
    public GlobalResDto<?> searchPopup(@RequestBody SearchReqDto searchReqDto) {

        return searchService.searchPopup(searchReqDto);
    }
}
