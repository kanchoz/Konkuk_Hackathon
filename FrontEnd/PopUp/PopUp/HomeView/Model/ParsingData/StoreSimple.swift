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


//class StoreSimpleList{
//
//    static var entireList:[StoreSimple] = [
//        StoreSimple(id: 9, category: "연예인", name: "뉴진스 버니랜드 (스포티파이X뉴진스)", location: "서울 종로구", duration: "2023년 7월 28일 ~ 2023년 8월 6일"),
//        StoreSimple(id: 5, category: "기타", name: "위글위글 랜드", location: "서울 광진구", duration: "2023년 8월 4일 ~ 2023년 8월 13일"),
//        StoreSimple(id: 6, category: "패션", name: "젠틀 몬스터", location: "서울 영등포구", duration: "2023년 8월 24일 ~ 2023년 9월 13일"),
//        StoreSimple(id: 18, category: "푸드", name: "Horok! Subway Liquor Trip", location: "서울 마포구", duration: "2023년 7월 1일 ~ 2023년 9월 중"),
//    ]
//
//    static var characterList:[StoreSimple] = [
//        StoreSimple(id: <#T##Int#>, category: <#T##String#>, name: <#String#>, location: <#T##String#>, duration: <#T##String#>),
//        StoreSimple(id: <#T##Int#>, category: <#T##String#>, name: <#String#>, location: <#T##String#>, duration: <#T##String#>),
//        StoreSimple(id: <#T##Int#>, category: <#T##String#>, name: <#String#>, location: <#T##String#>, duration: <#T##String#>),
//        StoreSimple(id: <#T##Int#>, category: <#T##String#>, name: <#String#>, location: <#T##String#>, duration: <#T##String#>),
//    ]
//
//    static var starList:[StoreSimple] = [
//        StoreSimple(id: 9, category: "연예인", name: "뉴진스 버니랜드 (스포티파이X뉴진스)", location: "서울 종로구", duration: "2023년 7월 28일 ~ 2023년 8월 6일"),
//        StoreSimple(id: <#T##Int#>, category: <#T##String#>, name: <#String#>, location: <#T##String#>, duration: <#T##String#>),
//        StoreSimple(id: <#T##Int#>, category: <#T##String#>, name: <#String#>, location: <#T##String#>, duration: <#T##String#>),
//        StoreSimple(id: <#T##Int#>, category: <#T##String#>, name: <#String#>, location: <#T##String#>, duration: <#T##String#>),
//    ]
//
//    static var foodList:[StoreSimple] = [
//        StoreSimple(id: <#T##Int#>, category: <#T##String#>, name: <#String#>, location: <#T##String#>, duration: <#T##String#>),
//        StoreSimple(id: <#T##Int#>, category: <#T##String#>, name: <#String#>, location: <#T##String#>, duration: <#T##String#>),
//        StoreSimple(id: <#T##Int#>, category: <#T##String#>, name: <#String#>, location: <#T##String#>, duration: <#T##String#>),
//        StoreSimple(id: <#T##Int#>, category: <#T##String#>, name: <#String#>, location: <#T##String#>, duration: <#T##String#>),
//    ]
//
//    static var etcList:[StoreSimple] = [
//        StoreSimple(id: 5, category: "기타", name: "위글위글 랜드", location: "서울 광진구", duration: "2023년 8월 4일 ~ 2023년 8월 13일"),
//        StoreSimple(id: <#T##Int#>, category: <#T##String#>, name: <#String#>, location: <#T##String#>, duration: <#T##String#>),
//        StoreSimple(id: <#T##Int#>, category: <#T##String#>, name: <#String#>, location: <#T##String#>, duration: <#T##String#>),
//        StoreSimple(id: <#T##Int#>, category: <#T##String#>, name: <#String#>, location: <#T##String#>, duration: <#T##String#>),
//    ]
//
//    static var fashionList:[StoreSimple] = [
//        StoreSimple(id: 6, category: "패션", name: "젠틀 몬스터", location: "서울 영등포구", duration: "2023년 8월 24일 ~ 2023년 9월 13일"),
//        StoreSimple(id: <#T##Int#>, category: <#T##String#>, name: <#String#>, location: <#T##String#>, duration: <#T##String#>),
//        StoreSimple(id: <#T##Int#>, category: <#T##String#>, name: <#String#>, location: <#T##String#>, duration: <#T##String#>),
//        StoreSimple(id: <#T##Int#>, category: <#T##String#>, name: <#String#>, location: <#T##String#>, duration: <#T##String#>),
//    ]
//
//    static var storeList:[[StoreSimple]] = [
//        entireList, starList, foodList, etcList
//    ]
//
//}
