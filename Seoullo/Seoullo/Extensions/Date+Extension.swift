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
}
