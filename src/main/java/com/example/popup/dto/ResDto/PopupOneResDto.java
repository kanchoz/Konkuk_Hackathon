package com.example.popup.dto.ResDto;

import com.example.popup.domain.Popup;
import com.example.popup.domain.Review;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PopupOneResDto {

    private Long popupId;
    private String image;
    private String theme;
    private String name;
    private String detailInfo;
    private List<Review> reviews;
    private String location;
    private String duration;
    private String schedule;
    private Boolean isFree;
    private Boolean parking;
    private Boolean isMarked;



    public PopupOneResDto(Popup popup, List<Review> reviews) {
        this.popupId = popup.getPopupId();
        this.image = popup.getImage();
        this.theme = popup.getTheme();
        this.name = popup.getName();
        this.detailInfo = popup.getDetailInfo();
        this.reviews= reviews;
        this.location = popup.getLocation();
        this.duration = popup.getDuration();
        this.schedule = popup.getSchedule();
        this.isFree = popup.getIsFree();
        this.parking = popup.getParking();
        this.isMarked = popup.getIsMarked();
    }
}
