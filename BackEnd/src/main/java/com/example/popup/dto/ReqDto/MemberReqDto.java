package com.example.popup.dto.ReqDto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class MemberReqDto {


    @NotBlank
    private String email;

    @NotBlank
    private String accountPw;
}
