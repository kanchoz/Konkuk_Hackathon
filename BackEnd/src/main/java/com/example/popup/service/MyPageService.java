package com.example.popup.service;

import com.example.popup.domain.Popup;
import com.example.popup.dto.ResDto.GlobalResDto;
import com.example.popup.exception.CustomException;
import com.example.popup.exception.ErrorCode;
import com.example.popup.repository.PopupRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MyPageService {

    private final PopupRepository popupRepository;

    @Transactional
    public GlobalResDto<?> getAllSavePopup() {

        List<Popup> popupList = popupRepository.findAllByIsMarkedTrue();


        return GlobalResDto.success(popupList, null);
    }

    @Transactional
    public GlobalResDto<?> getDeletePopup(Long popupId) {

        Popup popup = popupRepository.findById(popupId).orElseThrow(
                () -> new CustomException(ErrorCode.Not_Found_Popup)
        );

        popup.update2Popup();

        popupRepository.save(popup);

        return GlobalResDto.success(null, null);
    }
}
