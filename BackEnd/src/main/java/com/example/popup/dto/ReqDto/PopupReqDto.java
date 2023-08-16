package com.example.popup.dto.ReqDto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.validation.constraints.NotBlank;
import java.util.List;

@Getter
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

    @ElementCollection
    @Column(name = "review_counts")
    private List<Long> reviewCounts;
}
