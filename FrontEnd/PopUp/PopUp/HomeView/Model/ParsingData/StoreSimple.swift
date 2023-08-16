//
//  StoreSimple.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/17.
//

import Foundation

struct StoreSimple{
    let id: Int
    let category: String
    let name: String
    let location: String
    let duration: String
}


class StoreSimpleList{

    static var entireList:[StoreSimple] = [
        StoreSimple(id: 1, category: "연예인", name: "르세라핌", location: "서울시 강남구", duration: "2023년 9월 10일 ~ 2023년 9월 20일"),
        StoreSimple(id: 2, category: "패션", name: "마르헨제이", location: "서울시 강동구", duration: "2023년 8월 25일 ~ 2023년 9월 5일"),
        StoreSimple(id: 3, category: "패션", name: "미스 디올", location: "서울시 강남구", duration: "2023년 9월 15일 ~ 2023년 10월 5일"),
        StoreSimple(id: 4, category: "패션", name: "스타일러 그라운드", location: "서울시 마포구", duration: "2023년 8월 20일 ~ 2023년 8월 30일"),
        StoreSimple(id: 5, category: "기타", name: "위글위글 랜드", location: "서울시 종로구", duration: "2023년 9월 1일 ~ 2023년 9월 10일"),
        StoreSimple(id: 6, category: "패션", name: "젠틀 몬스터", location: "서울시 강남구", duration: "2023년 9월 10일 ~ 2023년 9월 20일"),
        StoreSimple(id: 7, category: "패션", name: "페라가모", location: "서울시 강서구", duration: "2023년 9월 5일 ~ 2023년 9월 15일"),
        StoreSimple(id: 8, category: "패션", name: "Rock", location: "서울시 홍대구", duration: "2023년 8월 10일 ~ 2023년 8월 20일"),
        StoreSimple(id: 9, category: "연예인", name: "뉴진스", location: "서울시 강남구", duration: "2023년 9월 1일 ~ 2023년 9월 10일"),
        StoreSimple(id: 10, category: "기타", name: "베어", location: "서울시 서초구", duration: "2023년 8월 15일 ~ 2023년 8월 25일"),
        StoreSimple(id: 11, category: "캐릭터", name: "짱구는 못말려", location: "서울시 마포구", duration: "2023년 9월 5일 ~ 2023년 9월 15일"),
        StoreSimple(id: 12, category: "기타", name: "토일렛 페이퍼", location: "서울시 강북구", duration: "2023년 8월 20일 ~ 2023년 8월 30일"),
        StoreSimple(id: 14, category: "연예인", name: "세븐틴", location: "서울시 강남구", duration: "2023년 9월 5일 ~ 2023년 9월 15일"),
        StoreSimple(id: 15, category: "연예인", name: "아이들", location: "서울시 강남구", duration: "2023년 8월 25일 ~ 2023년 9월 5일"),
        StoreSimple(id: 16, category: "패션", name: "예스아이씨", location: "서울시 강남구", duration: "2023년 9월 10일 ~ 2023년 9월 20일"),
        StoreSimple(id: 17, category: "연예인", name: "BTS", location: "서울시 용산구", duration: "2023년 8월 20일 ~ 2023년 8월 30일"),
        StoreSimple(id: 18, category: "푸드", name: "Horok!", location: "서울시 마포구", duration: "2023년 9월 1일 ~ 2023년 9월 10일"),
        StoreSimple(id: 19, category: "연예인", name: "엔믹스", location: "서울시 강남구", duration: "2023년 8월 25일 ~ 2023년 9월 5일"),
        StoreSimple(id: 20, category: "캐릭터", name: "반쮸토끼x", location: "서울시 강남구", duration: "2023년 9월 10일 ~ 2023년 9월 20일"),
        StoreSimple(id: 21, category: "연예인", name: "김재용", location: "서울시 강서구", duration: "2023년 8월 20일 ~ 2023년 8월 30일"),
        StoreSimple(id: 22, category: "기타", name: "아크로밧", location: "서울시 강남구", duration: "2023년 9월 5일 ~ 2023년 9월 15일"),
        StoreSimple(id: 23, category: "기타", name: "토리든", location: "서울시 강동구", duration: "2023년 9월 10일 ~ 2023년 9월 20일"),
        StoreSimple(id: 24, category: "푸드", name: "FRIEZE SEOUL", location: "서울시 종로구", duration: "2023년 8월 15일 ~ 2023년 8월 25일"),
        StoreSimple(id: 25, category: "푸드", name: "제임슨", location: "서울시 강남구", duration: "2023년 9월 1일 ~ 2023년 9월 10일"),
        StoreSimple(id: 26, category: "푸드", name: "팔도밥상페어", location: "서울시 마포구", duration: "2023년 8월 20일 ~ 2023년 8월 30일"),
        StoreSimple(id: 27, category: "캐릭터", name: "디즈니", location: "서울시 강남구", duration: "2023년 9월 5일 ~ 2023년 9월 15일"),
        StoreSimple(id: 28, category: "기타", name: "호즈미", location: "서울시 강동구", duration: "2023년 9월 10일 ~ 2023년 9월 20일"),
        StoreSimple(id: 29, category: "기타", name: "리스테린", location: "서울시 강남구", duration: "2023년 8월 25일 ~ 2023년 9월 5일"),
        StoreSimple(id: 30, category: "푸드", name: "노티드", location: "서울시 마포구", duration: "2023년 9월 1일 ~ 2023년 9월 10일"),
        StoreSimple(id: 31, category: "푸드", name: "포도도", location: "서울시 강서구", duration: "2023년 8월 20일 ~ 2023년 8월 30일"),
    ]

    static var characterList:[StoreSimple] = [
        StoreSimple(id: 11, category: "캐릭터", name: "짱구는 못말려", location: "서울시 마포구", duration: "2023년 9월 5일 ~ 2023년 9월 15일"),
        StoreSimple(id: 20, category: "캐릭터", name: "반쮸토끼x", location: "서울시 강남구", duration: "2023년 9월 10일 ~ 2023년 9월 20일"),
        StoreSimple(id: 27, category: "캐릭터", name: "디즈니", location: "서울시 강남구", duration: "2023년 9월 5일 ~ 2023년 9월 15일"),
    ]

    static var starList:[StoreSimple] = [
        StoreSimple(id: 1, category: "연예인", name: "르세라핌", location: "서울시 강남구", duration: "2023년 9월 10일 ~ 2023년 9월 20일"),
        StoreSimple(id: 9, category: "연예인", name: "뉴진스", location: "서울시 강남구", duration: "2023년 9월 1일 ~ 2023년 9월 10일"),
        StoreSimple(id: 14, category: "연예인", name: "세븐틴", location: "서울시 강남구", duration: "2023년 9월 5일 ~ 2023년 9월 15일"),
        StoreSimple(id: 15, category: "연예인", name: "아이들", location: "서울시 강남구", duration: "2023년 8월 25일 ~ 2023년 9월 5일"),
        StoreSimple(id: 17, category: "연예인", name: "BTS", location: "서울시 용산구", duration: "2023년 8월 20일 ~ 2023년 8월 30일"),
        StoreSimple(id: 19, category: "연예인", name: "엔믹스", location: "서울시 강남구", duration: "2023년 8월 25일 ~ 2023년 9월 5일"),
        StoreSimple(id: 21, category: "연예인", name: "김재용", location: "서울시 강서구", duration: "2023년 8월 20일 ~ 2023년 8월 30일"),
        
    ]

    static var foodList:[StoreSimple] = [
        StoreSimple(id: 18, category: "푸드", name: "Horok!", location: "서울시 마포구", duration: "2023년 9월 1일 ~ 2023년 9월 10일"),
        StoreSimple(id: 24, category: "푸드", name: "FRIEZE SEOUL", location: "서울시 종로구", duration: "2023년 8월 15일 ~ 2023년 8월 25일"),
        StoreSimple(id: 25, category: "푸드", name: "제임슨", location: "서울시 강남구", duration: "2023년 9월 1일 ~ 2023년 9월 10일"),
        StoreSimple(id: 26, category: "푸드", name: "팔도밥상페어", location: "서울시 마포구", duration: "2023년 8월 20일 ~ 2023년 8월 30일"),
        StoreSimple(id: 30, category: "푸드", name: "노티드", location: "서울시 마포구", duration: "2023년 9월 1일 ~ 2023년 9월 10일"),
        StoreSimple(id: 31, category: "푸드", name: "포도도", location: "서울시 강서구", duration: "2023년 8월 20일 ~ 2023년 8월 30일"),
    ]

    static var etcList:[StoreSimple] = [
        StoreSimple(id: 5, category: "기타", name: "위글위글 랜드", location: "서울 광진구", duration: "2023년 8월 4일 ~ 2023년 8월 13일"),
        StoreSimple(id: 22, category: "기타", name: "아크로밧", location: "서울시 강남구", duration: "2023년 9월 5일 ~ 2023년 9월 15일"),
        StoreSimple(id: 23, category: "기타", name: "토리든", location: "서울시 강동구", duration: "2023년 9월 10일 ~ 2023년 9월 20일"),
        StoreSimple(id: 28, category: "기타", name: "호즈미", location: "서울시 강동구", duration: "2023년 9월 10일 ~ 2023년 9월 20일"),
        StoreSimple(id: 29, category: "기타", name: "리스테린", location: "서울시 강남구", duration: "2023년 8월 25일 ~ 2023년 9월 5일"),
        
    ]

    static var fashionList:[StoreSimple] = [
        StoreSimple(id: 2, category: "패션", name: "마르헨제이", location: "서울시 강동구", duration: "2023년 8월 25일 ~ 2023년 9월 5일"),
        StoreSimple(id: 3, category: "패션", name: "미스 디올", location: "서울시 강남구", duration: "2023년 9월 15일 ~ 2023년 10월 5일"),
        StoreSimple(id: 4, category: "패션", name: "스타일러 그라운드", location: "서울시 마포구", duration: "2023년 8월 20일 ~ 2023년 8월 30일"),
        StoreSimple(id: 6, category: "패션", name: "젠틀 몬스터", location: "서울 영등포구", duration: "2023년 8월 24일 ~ 2023년 9월 13일"),
        StoreSimple(id: 7, category: "패션", name: "페라가모", location: "서울시 강서구", duration: "2023년 9월 5일 ~ 2023년 9월 15일"),
        StoreSimple(id: 8, category: "패션", name: "Rock", location: "서울시 홍대구", duration: "2023년 8월 10일 ~ 2023년 8월 20일"),
        StoreSimple(id: 16, category: "패션", name: "예스아이씨", location: "서울시 강남구", duration: "2023년 9월 10일 ~ 2023년 9월 20일"),
        

    ]

    static var storeList:[[StoreSimple]] = [
        entireList, characterList, starList, fashionList, foodList, foodList, etcList
    ]

}
