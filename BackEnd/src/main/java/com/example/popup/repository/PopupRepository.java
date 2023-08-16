package com.example.popup.repository;

import com.example.popup.domain.Popup;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface PopupRepository extends JpaRepository<Popup, Long> {

    List<Popup> findAllByIsMarkedTrue();
    List<Popup> findByTheme(String theme);
    List<Popup> findByName(String name);
}
