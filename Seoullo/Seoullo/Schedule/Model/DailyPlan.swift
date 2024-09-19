//
//  DailyPlan.swift
//  Seoullo
//
//  Created by 김혜수 on 9/15/24.
//

import Foundation

struct DailyPlan: Identifiable {
    var id = UUID()
    var date: Date
    var places: [Place]
}
