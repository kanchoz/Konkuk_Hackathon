//
//  PopupManager.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/17.
//

import Foundation
import Alamofire

struct PopupManager {
    static func getAllPopup(completion: @escaping (Result<[PopupResponseStructure], Error>) -> Void) {
        let endPoint = APIConstants.Main.getAllPopups
        
        AF.request(endPoint, method: .get)
            .validate()
            .responseDecodable(of: PopupList.self) { response in
                print(response)
                switch response.result {
                case .success(let res):
                    let allPopups = res.data
                    print("**************result*************")
                    print(allPopups)
                    completion(.success(allPopups))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    static func getPopupDetail(id: Int, completion: @escaping (Result<PopupDetail, Error>) -> Void) {
        let endPoint = String(format: APIConstants.PopupDetail.getPopupDetail, id)
        
        AF.request(endPoint, method: .get)
            .validate()
            .responseDecodable(of: PopupDetailStruct.self) { response in
                print(response)
                switch response.result {
                case .success(let res):
                    let popupDetail = res.data
                    print("**************result*************")
                    print(popupDetail)
                    completion(.success(popupDetail))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    
    static func getMyAllSavedPopup(completion: @escaping (Result<[MyPopup], Error>) -> Void) {
        let endPoint = APIConstants.MyPage.getAllSavedPopup
        
        AF.request(endPoint, method: .get)
            .validate()
            .responseDecodable(of: MyAllPopup.self) { response in
                print(response)
                switch response.result {
                case .success(let res):
                    let MyPopups = res.data
                    print("**************result*************")
                    print(MyPopups)
                    completion(.success(MyPopups))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
}
