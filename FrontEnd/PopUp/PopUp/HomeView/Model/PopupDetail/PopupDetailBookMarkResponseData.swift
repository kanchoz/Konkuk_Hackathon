//
//  PopupDetailBookMarkResponseData.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/16.
//

import Foundation

struct PopupDetailBookMarkResponseData: Codable {
    let status: Int
    let msg: PopupDetailBookMarkMessage
    let data: PopupDetailBookMarkData
}

struct PopupDetailBookMarkMessage: Codable {
    let value: String
}

struct PopupDetailBookMarkData: Codable {
    let isMarked: Bool
}
