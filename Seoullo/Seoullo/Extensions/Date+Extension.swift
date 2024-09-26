//
//  Date+Extention.swift
//  Seoullo
//
//  Created by 김혜수 on 9/15/24.
//

import Foundation

extension Date {
    func formatToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: self)
    }

    static func fromString(_ string: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: string)
    }

    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self)) ?? self
    }

    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월"
        return formatter.string(from: self)
    }
}
