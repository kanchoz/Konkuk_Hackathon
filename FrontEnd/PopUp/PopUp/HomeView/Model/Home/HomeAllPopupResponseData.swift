//
//  HomeAllPopupResponseData.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/16.
//

import Foundation

struct HomeAllPopupResponseData: Codable {
    let status: Int
    let msg: HomeAllPopupMessage
    let data: [HomeAllPopupData]
}

struct HomeAllPopupMessage: Codable {
    let value: String
}

struct HomeAllPopupData: Codable {
    let popupId: Int
    let image: String
    let theme: String
    let name: String
    let location: String
    let duration: String
    let schedule: String
    let isFree: Bool
    let parking: Bool
}
