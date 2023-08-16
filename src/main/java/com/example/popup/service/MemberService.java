package com.example.popup.service;

import com.example.popup.domain.Member;
import com.example.popup.dto.ReqDto.MemberReqDto;
import com.example.popup.dto.ResDto.GlobalResDto;
import com.example.popup.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberRepository memberRepository;

    @Transactional
    public GlobalResDto<?> login(MemberReqDto memberReqDto) {

        Member member = new Member(memberReqDto);
        memberRepository.save(member);

        return GlobalResDto.success(null,null);

    }
}
