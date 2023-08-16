//
//  HomeWeeklyHotResponseModel.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/16.
//

import Foundation

struct HomeWeeklyPopupResponseData: Codable {
    let status: Int
    let msg: HomeWeeklyPopupResponseMessage
    let data: HomeWeeklyPopupResponseDataInfo
}

struct HomeWeeklyPopupResponseMessage: Codable {
    let value: String
}

struct HomeWeeklyPopupResponseDataInfo: Codable {
    let images: [String]
}


