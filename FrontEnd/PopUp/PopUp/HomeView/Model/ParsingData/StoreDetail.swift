//
//  StoreDetail.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/17.
//

import Foundation

struct StoreDetail {
    let id: Int
    let category: String
    let name: String
    let info: String
    let reviews: [Review]
    let duration: String
    let locoationDetail: String
    let sns: String
}

struct Review {
    let content: String
    let cnt: Int
}

class StoreDetailList{
    
    static var review1: [Review] = [
        Review(content: "볼거리가 많아요", cnt: 250),
        Review(content: "이벤트가 있어요", cnt: 180),
        Review(content: "매장이 넓어요", cnt: 100),
        Review(content: "웨이팅이 길어요", cnt: 95)
    ]
    
    static var review2: [Review] = [
        Review(content: "매장이 넓어요", cnt: 300),
        Review(content: "상품이 다양해요", cnt: 280),
        Review(content: "이벤트가 있어요", cnt: 10),
        Review(content: "친절해요", cnt: 5),
        Review(content: "취식 공간이 있어요", cnt: 1)
    ]
    
    static var review3: [Review] = [
        Review(content: "볼거리가 많아요", cnt: 404),
        Review(content: "상품이 다양해요", cnt: 391),
        Review(content: "이벤트가 있어요", cnt: 222),
        Review(content: "찬절해요", cnt: 178),
        Review(content: "바로 들어갈 수 있어요", cnt: 10),
        Review(content: "주차하기 편해요", cnt: 9),
        Review(content: "웨이팅이 길어요", cnt: 2)
    ]
    
    static var review4: [Review] = [
        Review(content: "주차하기 편해요", cnt: 250),
        Review(content: "매장이 넓어요", cnt: 180),
        Review(content: "이벤트가 있어요", cnt: 100),
        Review(content: "상품이 다양해요", cnt: 95)
    ]
    
    static var review5: [Review] = [
        Review(content: "친절해요", cnt: 99),
        Review(content: "바로 들어갈 수 있어요", cnt: 56),
        Review(content: "취식 공간이 있어요", cnt: 41),
        Review(content: "무료배포 굿즈가 있어요", cnt: 39)
    ]
    
    static var list: [StoreDetail] = [
        StoreDetail(id: 9, category: "연예인", name: "뉴진스 버니랜드 (뉴진스X스포티파이)", info: "프랑스 럭셔리 브랜드 롱샴과 아트 매거진 토이렛페이퍼의 콜라보레이션 팝업스토어", reviews: review1, duration: "2023.08.11~2023.08.31", locoationDetail: "잠실 롯데월드몰 1층 아트리움 광장 서울 올림픽로 300 롯데월드몰", sns: "@longchamp / @tpbeauty_kr")
    ]
    
    static func findStore(idx: Int) -> StoreDetail?{
        
        for storeDetail in StoreDetailList.list{
               if storeDetail.id == idx{
                   return storeDetail
               }
        }
        
       return nil
        
    }
    
    
}
