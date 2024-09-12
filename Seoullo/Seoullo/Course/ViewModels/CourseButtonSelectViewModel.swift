//
//  CourseButtonSelectViewModel.swift
//  Seoullo
//
//  Created by 이유경 on 9/12/24.
//

import SwiftUI

enum CourseButtonSelect: String {
    case course = "코스추천"
    case hotPlace = "핫플레이스"
    case festival = "축제"
    case culture = "문화시설"
}

class CourseButtonSelectViewModel: ObservableObject {
    @Published var mainContentType: CourseButtonSelect = .course
}
