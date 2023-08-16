//
//  HomeManager.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/16.
//

import Foundation
import Alamofire

struct HomeManager {
    
    static func getAllWeeklyHotPopup(completion: @escaping (Result<[String], Error>) -> Void) {
        let endPoint = APIConstants.Main.getWeeklyHotPopup
        
        AF.request(endPoint, method: .get, headers: APIConstants.headers)
            .validate()
            .responseDecodable(of: HomeWeeklyPopupResponseData.self) { response in
                switch response.result {
                case .success(let res):
                    let images = res.data.images
                    completion(.success(images))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    static func getAllWeeklyHotPopup(completion: @escaping (Result<[HomeAllPopupData], Error>) -> Void) {
        let endPoint = APIConstants.Main.getAllPopups
        
        AF.request(endPoint, method: .get, headers: APIConstants.headers)
            .validate()
            .responseDecodable(of: HomeAllPopupResponseData.self) { response in
                switch response.result {
                case .success(let res):
                    let ids = res.data
                    completion(.success(ids))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}
