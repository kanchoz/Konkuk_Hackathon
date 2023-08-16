//
//  DummyStore.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/13.
//

import Foundation
import MapKit

class DummyStore{
   static let storeLocation = [
    Store(name: "젠틀몬스터 이즈백", sort: "Food", id: 6, location: "서울시 강남구", coordinate: CLLocationCoordinate2D(latitude: 37.546796, longitude: 127.041957)),
    Store(name: "르세라핌", sort: "Star", id: 1, location: "서울시 강남구", coordinate: CLLocationCoordinate2D(latitude: 37.546796, longitude: 127.041674)),
    Store(name: "뉴진스 바니랜드", sort: "Star", id: 9, location: "서울시 강남구", coordinate: CLLocationCoordinate2D(latitude: 37.546829, longitude: 127.043398)),
    Store(name: "포도도", sort: "Food", id: 31, location: "서울시 강서구", coordinate: CLLocationCoordinate2D(latitude: 37.547035, longitude: 127.041136)),
    ]
    
    static let HotStore = [
        5, 6, 9, 31
    ]
}

class DummyReview{
    static let review = [
             ["kind", "parking"],
             ["event", "goods", "food"],
             ["event", "goods", "food", "kind"],
             [],
             ["enter"],
             ["waiting", "kind"],
     ]
}


struct Store{
    let name:String
    let sort:String
    let id: Int
    let location: String
    let coordinate: CLLocationCoordinate2D
}

