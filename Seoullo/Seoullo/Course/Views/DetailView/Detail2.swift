//
//  Detail2.swift
//  Seoullo
//
//  Created by 이유경 on 9/23/24.
//

import Foundation

struct Detail2Item: Codable, Identifiable {
    let id: String
    let title: String
    let addr: String
    let mapx: String
    let mapy: String
    let firstImage: String
    
    enum CodingKeys: String, CodingKey {
        case id = "contentid"
        case addr = "addr1"
        case firstImage = "firstimage"
        case title, mapx, mapy
    }
}

struct Detail2Items: Codable {
    let item: [Detail2Item]
}

struct Detail2Body: Codable {
    let items: Detail2Items
}

struct Detail2Response: Codable {
    let body: Detail2Body
}

struct Detail2Root: Codable {
    let response: Detail2Response
}
