package com.example.popup.dto.ReqDto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PopupReqDto {

    @NotBlank
    private String image;

    @NotBlank
    private String theme;

    @NotBlank
    private String name;

    @NotBlank
    private String location;

    @NotBlank
    private String duration;

    @NotBlank
    private String schedule;

    @NotBlank
    private Boolean isFree;

    @NotBlank
    private Boolean parking;

    @NotBlank
    private Boolean isMarked;

    @NotBlank
    private String detailLocation;

    @NotBlank
    private String sns;

    @NotBlank
    private String detailInfo;
}
