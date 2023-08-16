package com.example.popup.service;

import com.example.popup.domain.Popup;
import com.example.popup.dto.ResDto.GlobalResDto;
import com.example.popup.dto.ResDto.PopupHomeResDto;
import com.example.popup.repository.PopupRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class HomeService {

    private final PopupRepository popupRepository;

    @Transactional
    public GlobalResDto<?> getHotPopup() {

        List<Popup> popups = popupRepository.findAll();
        List<String> popupNames = popups.stream()
                .map(Popup::getName)
                .collect(Collectors.toList());

        return GlobalResDto.success(popupNames, null);
    }

    @Transactional
    public GlobalResDto<?> getAllPopup() throws IOException {

        List<Popup> popups = popupRepository.findAll();


        List<PopupHomeResDto> popupResDtoList = popups.stream()
                .map(PopupHomeResDto::new)
                .collect(Collectors.toList());

        return GlobalResDto.success(popupResDtoList, null);
    }
}
