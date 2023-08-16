//
//  PopupDetailResponseStructure.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/17.
//

import Foundation

// MARK: - Welcome
struct PopupDetailStruct: Codable {
    let status: Int
    let data: PopupDetail
    let msg: JSONNull?
}

// MARK: - DataClass
struct PopupDetail: Codable {
    let popupID: Int?
    let image, theme, name, detailInfo: String
    let location, duration, schedule: String
    let isFree, parking, isMarked: Bool
    let sns: String
    let reviewCounts: [Int]

    enum CodingKeys: String, CodingKey {
        case popupID = "popupId"
        case image, theme, name, detailInfo, location, duration, schedule, isFree, parking, isMarked, sns, reviewCounts
    }
}

//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
