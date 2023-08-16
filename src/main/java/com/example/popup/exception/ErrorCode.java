package com.example.popup.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
@AllArgsConstructor
public enum ErrorCode {

    Not_Found_Popup(HttpStatus.NOT_FOUND.value(), "P001", "팝업을 찾을 수 없습니다."),

    ERROR(HttpStatus.NO_CONTENT.value(),"S001","알수업는오류");


    private final int status;
    private final String code;
    private final String message;
}
