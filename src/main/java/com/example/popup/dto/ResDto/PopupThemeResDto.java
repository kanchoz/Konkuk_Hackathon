package com.example.popup.dto.ResDto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class PopupThemeResDto {

    private List<PopupHomeResDto> popupHomeResDtos;

    public PopupThemeResDto(List<PopupHomeResDto> popupHomeResDtos) {
        this.popupHomeResDtos = popupHomeResDtos;
    }
}
