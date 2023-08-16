package com.example.popup.domain;

import com.example.popup.dto.ReqDto.MemberReqDto;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long accountId;

    @Column
    private String email;

    @Column
    private String accountPw;

    public Member(MemberReqDto memberReqDto) {

        this.email = memberReqDto.getEmail();
        this.accountPw = memberReqDto.getAccountPw();
    }
}
