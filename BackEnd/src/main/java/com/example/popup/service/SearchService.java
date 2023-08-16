package com.example.popup.service;

import com.example.popup.domain.Popup;
import com.example.popup.dto.ReqDto.SearchReqDto;
import com.example.popup.dto.ResDto.GlobalResDto;
import com.example.popup.dto.ResDto.PopupOneResDto;
import com.example.popup.repository.PopupRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class SearchService {

    private final PopupRepository popupRepository;

    @Transactional
    public GlobalResDto<?> searchPopup(SearchReqDto searchReqDto) {

        List<Popup> popup = popupRepository.findByName(searchReqDto.getName());

        return GlobalResDto.success(popup, null);
    }
}
