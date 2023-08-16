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
