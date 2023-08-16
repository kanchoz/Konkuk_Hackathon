package com.example.popup.controller;

import com.example.popup.domain.Popup;
import com.example.popup.dto.ReqDto.MemberReqDto;
import com.example.popup.dto.ReqDto.PopupReqDto;
import com.example.popup.dto.ResDto.GlobalResDto;
import com.example.popup.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;

    @PostMapping("/login")
    public GlobalResDto<?> login(@RequestBody MemberReqDto memberReqDto){


        return memberService.login(memberReqDto);
    }

}
