package com.example.popup.repository;

import com.example.popup.domain.Popup;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PopupRepository extends JpaRepository<Popup, Long> {

    List<Popup> findAllByIsMarkedTrue();
}
