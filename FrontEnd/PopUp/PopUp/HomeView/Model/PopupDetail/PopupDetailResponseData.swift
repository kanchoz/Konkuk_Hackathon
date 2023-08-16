//
//  PopupDetailResponseData.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/16.
//

import Foundation

struct PopupDetailResponseData: Codable {
    let status: Int
    let msg: PopupDetailMessage
    let data: PopupDetailData
}

struct PopupDetailMessage: Codable {
    let value: String
}

struct PopupDetailData: Codable {
    let popupId: Int
    let image: String
    let theme: String
    let name: String
    let detailInfo: String
    let reviews: [PopupDetailReview]
    let duration: String
    let detailLocation: String
    let sns: String
    let isMarked: Bool
}

struct PopupDetailReview: Codable {
    let image: String
    let content: String
    let reviewCnt: Int
}


// MARK: - Temp
struct Tmp: Codable {
    let status: Int
    let data: [Datum]
    let msg: JSONNull?
}

// MARK: - Datum
struct Datum: Codable {
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


