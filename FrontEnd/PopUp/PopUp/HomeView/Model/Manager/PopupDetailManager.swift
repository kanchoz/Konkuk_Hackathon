//
//  DetailManager.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/16.
//

import Foundation
import Alamofire

struct PopupDetailManager {
    
    static func getPopupDetail(completion: @escaping (Result<PopupDetailData, Error>) -> Void) {
        let endPoint = APIConstants.PopupDetail.getPopupDetail
        
        AF.request(endPoint, method: .get, headers: APIConstants.headers)
            .validate()
            .responseDecodable(of: PopupDetailResponseData.self) { response in
                switch response.result {
                case .success(let res):
                    let ids = res.data
                    completion(.success(ids))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    
    static func postBookMark(id: Int, isMarked: Bool, completion: @escaping (Result<Bool, Error>) -> Void) {
        let endPoint = APIConstants.PopupDetail.postPopupDetailBookMark
        
        let parameters: [String: Any] = [
            "popupid": Int(id),
            "isMarked": isMarked
        ]
        
        AF.request(endPoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: APIConstants.headers)
            .validate()
            .responseDecodable(of: PopupDetailBookMarkResponseData.self) { response in
                switch response.result {
                case .success(let res):
                    let is_marked = res.data.isMarked
                    completion(.success(is_marked))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        
    }
    
    static func searchPop(name: String, completion: @escaping (Result<PopupDetail, Error>) -> Void) {
        let endPoint = APIConstants.Search.searchURL
        
        let parameters: [String: Any] = [
            "name": name,
        ]
        
        AF.request(endPoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: APIConstants.headers)
            .validate()
            .responseDecodable(of: PopupDetailStruct.self) { response in
                print(response)
                switch response.result {
                
                case .success(let res):
                    let data = res.data
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        
    }
    
}
