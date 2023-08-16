package com.example.popup.service;

import com.example.popup.domain.Popup;
import com.example.popup.dto.ReqDto.PopupReqDto;
import com.example.popup.repository.PopupRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@RequiredArgsConstructor
public class PopupService {

    private final PopupRepository popupRepository;

    @Transactional
    public Popup getSave(PopupReqDto popupReqDto) {

        Popup popup = new Popup(popupReqDto);
        popupRepository.save(popup);

        return popup;
    }
}
