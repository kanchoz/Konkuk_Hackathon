//
//  StoreInfo.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/16.
//

import Foundation

struct StoreInfo{
    var id: Int
    var name: String
    var location : String
    var category : String
}

class StoreArr{
    static let arr1: [StoreInfo] = [
        StoreInfo(id: 15, name: "여자아이들 :NEV", location: "서울 송파구", category: "연예인"),
        StoreInfo(id: 14, name: "세븐틴 라잇댓", location: "서울 종로구", category: "연예인"),
        StoreInfo(id: 1, name: "르세라핌Xtmrw", location: "서울 영등포구", category: "연예인"),
        StoreInfo(id: 17, name: "BTS_보랏빛 물결", location: "서울 광진구", category: "연예인")
    ]
    static let arr2: [StoreInfo] = [
        StoreInfo(id: 6, name: "젠틀몬스터 이즈 백", location: "서울 영등포구", category: "패션"),
        StoreInfo(id: 5, name: "위글위글 랜드", location: "서울 광진구", category: "기타"),
        StoreInfo(id: 3, name: "미스 디올", location: "서울 성동구", category: "패션"),
        StoreInfo(id: 7, name: "페라가모", location: "서울 성동구", category: "패션"),
        StoreInfo(id: 2, name: "마르헨제이", location: "서울 성동구", category: "패션"),
        StoreInfo(id: 4, name: "스타일러 그라운드", location: "서울 성동구", category: "패션"),
        StoreInfo(id: 1, name: "르세라핌Xtmrw", location: "서울 영등포구", category: "연예인"),
        StoreInfo(id: 8, name: "Crank", location: "서울 용산구", category: "패션")
    ]
    
}
