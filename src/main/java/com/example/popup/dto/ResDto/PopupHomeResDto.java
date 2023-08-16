package com.example.popup.dto.ResDto;

import com.example.popup.domain.Popup;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PopupHomeResDto {

    private Long popupId;
    private String image;
    private String theme;
    private String name;
    private String location;
    private String duration;
    private String schedule;
    private Boolean isFree;
    private Boolean parking;
    private Boolean isMarked;
    private String detailLocation;
    private String sns;
    private String detailInfo;

    @ElementCollection
    @Column(name = "review_counts")
    private List<Long> reviewCounts;

    public PopupHomeResDto(Popup popup) {
        this.popupId = popup.getPopupId();
        this.image = popup.getImage();
        this.theme = popup.getTheme();
        this.name = popup.getName();
        this.location = popup.getLocation();
        this.duration = popup.getDuration();
        this.schedule = popup.getSchedule();
        this.isFree = popup.getIsFree();
        this.parking = popup.getParking();
        this.parking = popup.getParking();
        this.isMarked = popup.getIsMarked();
        this.detailLocation = popup.getDetailLocation();
        this.sns = popup.getSns();
        this.detailInfo = popup.getDetailInfo();
        this.reviewCounts = popup.getReviewCounts();
    }
}
