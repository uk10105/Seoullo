//
//  
// Detail.swift
//  Seoullo
//
//  Created by 이유경 on 9/23/24.
//

import Foundation

struct Detail1Item: Codable, Identifiable {
    let id: String
    let type: String
    let title: String
    let addr: String
    let mapx: String
    let mapy: String
    let firstImage: String
    
    enum CodingKeys: String, CodingKey {
        case id = "contentid"
        case type = "contenttypeid"
        case addr = "addr1"
        case firstImage = "firstimage"
        case title, mapx, mapy
    }
}

struct Detail1Items: Codable {
    let item: [Detail1Item]
}

struct Detail1Body: Codable {
    let items: Detail1Items
}

struct Detail1Response: Codable {
    let body: Detail1Body
}

struct Detail1Root: Codable {
    let response: Detail1Response
}
