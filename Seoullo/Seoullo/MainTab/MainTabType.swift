//
//  MainTabType.swift
//  Seoullo
//
//  Created by 김혜수 on 9/25/24.
//

import Foundation

enum MainTabType: String, CaseIterable {
    case bookmark
    case map
    case flag

    var title: String {
        switch self {
        case .bookmark:
            return "일정 관리"
        case .map:
            return "지도"
        case .flag:
            return "추천 코스"
        }
    }

    func imageName(selected: Bool) -> String {
        selected ? "\(rawValue).fill" : rawValue
    }
}
