//
//  Place.swift
//  Seoullo
//
//  Created by 김혜수 on 9/15/24.
//

import Foundation

struct Place: Identifiable {
    let id = UUID()
    var name: String
    var latitude: Double
    var longitude: Double
    var memo: String?
}
