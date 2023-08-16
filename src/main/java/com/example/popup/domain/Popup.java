package com.example.popup.domain;

import com.example.popup.dto.ReqDto.PopupReqDto;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Popup {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long popupId;


    @Column(nullable = false)
    private String image;

    @Column(nullable = false)
    private String theme;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String location;

    @Column(nullable = false)
    private String duration;

    @Column(nullable = false)
    private String schedule;

    @Column(nullable = false)
    private Boolean isFree;

    @Column(nullable = false)
    private Boolean parking;

    @Column(nullable = false)
    private Boolean isMarked;

    @Column(nullable = false)
    private String detailLocation;

    @Column(nullable = false)
    private String sns;

    @Column(nullable = false)
    private String detailInfo;


    public Popup(PopupReqDto popupReqDto) {


        this.image=popupReqDto.getImage();
        this.theme=popupReqDto.getTheme();
        this.name=popupReqDto.getName();
        this.location=popupReqDto.getLocation();
        this.duration=popupReqDto.getDuration();
        this.schedule=popupReqDto.getSchedule();
        this.isFree=popupReqDto.getIsFree();
        this.parking=popupReqDto.getParking();
        this.isMarked=popupReqDto.getIsMarked();
        this.detailLocation=popupReqDto.getDetailLocation();
        this.sns=popupReqDto.getSns();
        this.detailInfo=popupReqDto.getDetailInfo();
    }

}
