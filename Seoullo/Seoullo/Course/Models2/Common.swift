//
//  Culture.swift
//  Seoullo
//
//  Created by 이유경 on 9/22/24.
//

import Foundation

struct CommonItem: Codable, Identifiable {
    let id: String
    let title: String
    let addr: String
    let mapx: String
    let mapy: String
    let firstImage: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "contentid"
        case addr = "addr1"
        case firstImage = "firstimage"
        case title, mapx, mapy
    }
}

struct CommonItems: Codable {
    let item: [CommonItem]
}

struct CommonBody: Codable {
    let items: CommonItems
}

struct CommonResponse: Codable {
    let body: CommonBody
}

struct CommonRoot: Codable {
    let response: CommonResponse
}

let commonDummy: [CommonItem] = [
    CommonItem(id: "2733967", title: "가회동성당", addr: "서울특별시 종로구 북촌로 57 (가회동)", mapx: "126.9846616856", mapy: "37.5820858828", firstImage: "http://tong.visitkorea.or.kr/cms/resource/09/3303909_image2_1.jpg"),
    CommonItem(id: "1116925", title: "갈산근린공원", addr: "서울특별시 양천구 신정동 162-56", mapx: "126.8684105358", mapy: "37.5061176314", firstImage: "http://tong.visitkorea.or.kr/cms/resource/62/2612062_image2_1.bmp"),
    CommonItem(id: "294439", title: "감로암(서울)", addr: "서울특별시 종로구 율곡로23길 16", mapx: "127.0066015446", mapy: "37.5753148419", firstImage: "http://tong.visitkorea.or.kr/cms/resource/85/2031885_image2_1.jpg")
]

enum SeoulDistrict: Int, CaseIterable {
    case gangnamgu = 1
    case gangdonggu
    case gangbukgu
    case gangseogu
    case gwanakgu
    case gwangjingu
    case gurogu
    case geumcheongu
    case nowongu
    case dobonggu
    case dongdaemungu
    case dongjakgu
    case mapogu
    case seodaemungu
    case seochogu
    case seongdonggu
    case seongbukgu
    case songpagu
    case yangcheongu
    case yeongdeungpogu
    case yongsangu
    case eunpyeonggu
    case jongnogu
    case junggu
    case jungnanggu
    
    var name: String {
        switch self {
        case .gangnamgu: return "강남구"
        case .gangdonggu: return "강동구"
        case .gangbukgu: return "강북구"
        case .gangseogu: return "강서구"
        case .gwanakgu: return "관악구"
        case .gwangjingu: return "광진구"
        case .gurogu: return "구로구"
        case .geumcheongu: return "금천구"
        case .nowongu: return "노원구"
        case .dobonggu: return "도봉구"
        case .dongdaemungu: return "동대문구"
        case .dongjakgu: return "동작구"
        case .mapogu: return "마포구"
        case .seodaemungu: return "서대문구"
        case .seochogu: return "서초구"
        case .seongdonggu: return "성동구"
        case .seongbukgu: return "성북구"
        case .songpagu: return "송파구"
        case .yangcheongu: return "양천구"
        case .yeongdeungpogu: return "영등포구"
        case .yongsangu: return "용산구"
        case .eunpyeonggu: return "은평구"
        case .jongnogu: return "종로구"
        case .junggu: return "중구"
        case .jungnanggu: return "중랑구"
        }
    }
}
