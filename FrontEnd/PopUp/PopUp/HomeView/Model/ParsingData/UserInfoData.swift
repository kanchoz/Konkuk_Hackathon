//
//  UserInfoData.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/16.
//

import Foundation

// MARK: - StatisticsResponse
struct StatisticsResponse: Codable {
    let status: Int
    let data: DataClass
    let msg: String
}

// MARK: - DataClass
struct DataClass: Codable {
    let userID: Int
    let accountName: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case accountName
    }
}
