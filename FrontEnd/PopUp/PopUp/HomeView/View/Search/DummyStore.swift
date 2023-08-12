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
            Store(name: "젠틀몬스터 이즈백", sort: "Food", coordinate: CLLocationCoordinate2D(latitude: 37.546796, longitude: 127.041957)),
            Store(name: "파스타 믹스", sort: "Food", coordinate: CLLocationCoordinate2D(latitude: 37.546796, longitude: 127.041674)),
            Store(name: "진로 날아오르다", sort: "Liquor", coordinate: CLLocationCoordinate2D(latitude: 37.546871, longitude: 127.042391)),
            Store(name: "BTS", sort: "Star", coordinate: CLLocationCoordinate2D(latitude: 37.547035, longitude: 127.041136)),
            Store(name: "르세라핌", sort: "Star", coordinate: CLLocationCoordinate2D(latitude: 37.547678, longitude: 127.041902)),
            Store(name: "박재범의 원소주", sort: "Liquor", coordinate: CLLocationCoordinate2D(latitude: 37.546617, longitude: 127.042071)),
            Store(name: "뉴진스 바니랜드", sort: "Star", coordinate: CLLocationCoordinate2D(latitude: 37.546829, longitude: 127.043398))
    
    ]
}


struct Store{
    let name:String
    let sort:String
    let coordinate: CLLocationCoordinate2D
}
