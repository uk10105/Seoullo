//
//  Route.swift
//  Seoullo
//
//  Created by 한유진 on 9/21/24.
//

// API: /detailInfo1
/*
 {
  "subnum": "0",
  "subcontentid": "128162",
  "subname": "숭례문",
  "subdetailoverview": "숭례문(崇禮門)은 조선 태조 5년(1396)에 최초로 축조되었고 1398년 2월 중건되었다. 이 문은 조선시대 한성 도성의 정문으로 4대문 가운데 남쪽에 위치하므로, 남대문으로도 불린다.\n"
 },
 {
  "subnum": "1",
  "subcontentid": "250364",
  "subname": "문화역서울 284(구, 서울역사)",
  "subdetailoverview": "서울역사(驛舍)는 동경대 교수였던 일본인 쓰가모토 야스시(塚本靖)가 설계하고, 1922년 6월에 착공하여 1925년 9월에 준공되었다. 당시 신축된 건물은 규모도 상당하였지만 지붕의 돔과 독특한 외관으로 장안의 화제가 되었다. 서울역사 1층 중앙홀은 공연·전시·이벤트·카페 등을 위한 공간으로, 2층은 공연·전시·세미나·회의 등을 위한 다목적 홀로 이용된다.\n",
 },
 {
  "subnum": "2",
  "subcontentid": "126509",
  "subname": "덕수궁",
  "subdetailoverview": "사적 제124호의 덕수궁은 본디 왕궁이 아니었다. 원래 성종의 형인 월산대군(1454∼1488)의 집이었으나, 1592년 임진왜란 때 왕궁이 모두 불타서 1593년 행궁으로 사용하기 시작하였다. 덕수궁에서 지난 날 많은 건물이 있었으나 현재 18,635평의 경내에 남아 있는 것은 대한문, 중화전, 광명문, 석어당, 준명당, 즉조당, 함녕전, 덕홍전 및 석조전 등에 불과하다.\n",
 }
 */

import Foundation

struct RouteItem: Codable, Identifiable {
    let index: String
    let id: String
    let title: String
    let overview: String?
    
    enum CodingKeys: String, CodingKey {
        case index = "subnum"
        case id = "subcontentid"
        case title = "subname"
        case overview = "subdetailoverview"
    }
}

struct Route: Codable {
    let item: [RouteItem]
}

struct RouteBody: Codable {
    let items: Route
}

struct RouteResponse: Codable {
    let body: RouteBody
}

struct RouteRoot: Codable {
    let response: RouteResponse
}

// API 데이터로 교체 후 코드 삭제
let sampleRoute: Route = Route(item: [
    RouteItem(index: "0",
              id: "128162", 
              title: "숭례문", 
              overview: "숭례문(崇禮門)은 조선 태조 5년(1396)에 최초로 축조되었고 1398년 2월 중건되었다. 이 문은 조선시대 한성 도성의 정문으로 4대문 가운데 남쪽에 위치하므로, 남대문으로도 불린다.\n"),
    RouteItem(index: "1",
              id: "250364",
              title: "문화역서울 284(구, 서울역사)",
              overview: "서울역사(驛舍)는 동경대 교수였던 일본인 쓰가모토 야스시(塚本靖)가 설계하고, 1922년 6월에 착공하여 1925년 9월에 준공되었다. 당시 신축된 건물은 규모도 상당하였지만 지붕의 돔과 독특한 외관으로 장안의 화제가 되었다. 서울역사 1층 중앙홀은 공연·전시·이벤트·카페 등을 위한 공간으로, 2층은 공연·전시·세미나·회의 등을 위한 다목적 홀로 이용된다.\n"),
    RouteItem(index: "2",
              id: "126509",
              title: "덕수궁",
              overview: "사적 제124호의 덕수궁은 본디 왕궁이 아니었다. 원래 성종의 형인 월산대군(1454∼1488)의 집이었으나, 1592년 임진왜란 때 왕궁이 모두 불타서 1593년 행궁으로 사용하기 시작하였다. 덕수궁에서 지난 날 많은 건물이 있었으나 현재 18,635평의 경내에 남아 있는 것은 대한문, 중화전, 광명문, 석어당, 준명당, 즉조당, 함녕전, 덕홍전 및 석조전 등에 불과하다.\n")
])
