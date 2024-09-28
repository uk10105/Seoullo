//
//  Detail3.swift
//  Seoullo
//
//  Created by 이유경 on 9/23/24.
//

import Foundation

struct Detail3Item: Codable, Identifiable {
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

struct Detail3Items: Codable {
    let item: [Detail3Item]
}

struct Detail3Body: Codable {
    let items: Detail3Items
}

struct Detail3Response: Codable {
    let body: Detail3Body
}

struct Detail3Root: Codable {
    let response: Detail3Response
}
