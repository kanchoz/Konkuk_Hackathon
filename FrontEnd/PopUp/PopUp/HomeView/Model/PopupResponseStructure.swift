//
//  PopupResponseStructure.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/17.
//

import Foundation

//struct PopupList: Codable{
//    let data: [PopupDetailData]
//}
//
//struct PopupResponseStructure: Codable{
//    let image: String?
//    let theme: String?
//    let name: String?
//    let location: String?
//    let duration: String?
//    let schedule: String?
//    let isFree: Bool?
//    let parking: Bool?
//    let isMarked: Bool?
//    let detailLocation: String?
//    let sns: String?
//    let detailInfo: String?
//    let reviewCounts: [Int]
//}


import Foundation

// MARK: - StatisticsResponse
struct PopupList: Codable {
    let status: Int
    let data: [PopupResponseStructure]
    let msg: JSONNull?
}

// MARK: - Datum
struct PopupResponseStructure: Codable {
    let popupID: Int
    let image: Image
    let theme, name, location, duration: String
    let schedule: Schedule
    let isFree, parking, isMarked: Bool
    let detailLocation, sns, detailInfo: String
    let reviewCounts: [Int]

    enum CodingKeys: String, CodingKey {
        case popupID = "popupId"
        case image, theme, name, location, duration, schedule, isFree, parking, isMarked, detailLocation, sns, detailInfo, reviewCounts
    }
}

enum Image: String, Codable {
    case d = "d"
}

enum Schedule: String, Codable {
    case 마감임박 = "마감 임박"
    case 오픈예정 = "오픈 예정"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
