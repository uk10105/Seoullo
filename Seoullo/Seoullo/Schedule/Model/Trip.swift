//
//  Trip.swift
//  Seoullo
//
//  Created by 김혜수 on 9/15/24.
//

import Foundation

struct Trip {
    var startDate: Date
    var endDate: Date
    var dailyPlans: [DailyPlan]?

    var duration: Int {
        return (Calendar.current.dateComponents([.day], from: startDate, to: endDate).day ?? 0) + 1
    }
}
