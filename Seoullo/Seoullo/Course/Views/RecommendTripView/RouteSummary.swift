//
//  RouteSummary.swift
//  Seoullo
//
//  Created by 한유진 on 9/21/24.
//

// API: /detailCommon1
/*
 {
   "response": {
     "header": {
       "resultCode": "0000",
       "resultMsg": "OK"
     },
     "body": {
       "items": {
         "item": [
           {
             "contentid": "2384832",
             "contenttypeid": "25",
             "title": "가정의 달, 싱글을 위한 혼자 먹는 밥상 코스",
             "createdtime": "20160524024219",
             "modifiedtime": "20230811103908",
             "firstimage": "http://tong.visitkorea.or.kr/cms/resource/70/2382970_image2_1.jpg",
             "firstimage2": "http://tong.visitkorea.or.kr/cms/resource/70/2382970_image3_1.jpg",
             "cpyrhtDivCd": "Type3",
             "cat1": "C01",
             "cat2": "C0117",
             "cat3": "C01170001",
             "overview": "싱글 인구가 점점 늘어나는 우리나라도 혼자서돔 즐거운 도시 코스를 소개한다. 트랜디하고 이국적인 이태원과 강남일대의 북적이고 한적한 산책 코스를 함께 한다면 편안한 주말을 보낼 수 있을 것이다."
           }
         ]
       },
       "numOfRows": 1,
       "pageNo": 1,
       "totalCount": 1
     }
   }
 }
 */

import Foundation

struct RouteSummary: Codable, Identifiable {
    let id: String
    let title: String
    let image1: String?
    let image2: String?
    let overview: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "contentid"
        case title
        case image1 = "firstimage"
        case image2 = "firstimage2"
        case overview
    }
}

struct RouteSummaryItems: Codable {
    let item: [RouteSummary]
}

struct RouteSummaryBody: Codable {
    let items: RouteSummaryItems
}

struct RouteSummaryResponse: Codable {
    let body: RouteSummaryBody
}

struct RouteSummaryRoot: Codable {
    let response: RouteSummaryResponse
}
