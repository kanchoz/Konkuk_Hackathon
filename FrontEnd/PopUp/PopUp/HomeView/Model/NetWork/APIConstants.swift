//
//  APIConstants.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/16.
//

import Foundation
import Alamofire

struct APIConstants {
    static let defaults = UserDefaults.standard
    static let baseURL = "http://13.209.9.10"
    static var token: String {
        if let token = defaults.value(forKey: "token") as? String {
            return token
        }
        else { return ""}
    }
    static let headers: HTTPHeaders = ["Access_Token": "Bearer \(token)"]
    
    
    
    struct Piece {
        
    }
    
    struct PieceInfo {
        
    }
    
    struct Main {
        static let getWeeklyHotPopup = baseURL + "/home/hotPopup"
        static let getAllPopups = baseURL + "/home/allPopup"
    }
    
    struct PopupDetail {
        static let getPopupDetail = baseURL + "/popup/@"
        // ex) let endpoint = String(format: APIConstants.PopupDetail.getPopupDetail, popupID)
        static let postPopupDetailBookMark = baseURL + "/popup/@"
        
    }
    
    struct MyPage {
        static let getAllSavedPopup = baseURL + "/mypage/savePopup"
        static let deleteSavedPopup = baseURL + "/mypage/savePopup/delete"
        static let getAllVisitedPopup = baseURL + "/mypage/visitPopup"
    }
    
    struct Search {
        
    }
    
    struct Login {
        
    }
}



