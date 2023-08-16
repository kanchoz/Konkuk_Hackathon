//
//  MyPopupResponseStructure.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/17.
//

import Foundation

// MARK: - Welcome
struct MyAllPopup: Codable {
    let status: Int
    let data: [MyPopup]
    let msg: JSONNull?
}

// MARK: - Datum
struct MyPopup: Codable {
    let popupID: Int
    let image, theme, name, location: String
    let duration, schedule: String
    let isFree, parking, isMarked: Bool
    let detailLocation, sns, detailInfo: String
    let reviewCounts: [Int]

    enum CodingKeys: String, CodingKey {
        case popupID = "popupId"
        case image, theme, name, location, duration, schedule, isFree, parking, isMarked, detailLocation, sns, detailInfo, reviewCounts
    }
}
