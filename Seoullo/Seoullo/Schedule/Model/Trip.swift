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

let dummyTrip = Trip(
    startDate: Date.fromString("2024-09-20")!,
    endDate: Date.fromString("2024-09-23")!,
    dailyPlans: [
        DailyPlan(
            date: Date.fromString("2024-09-20")!,
            places: [
                Place(name: "경복궁", latitude: 37.579617, longitude: 126.977041, memo: "조선의 궁궐"),
                Place(name: "광화문광장", latitude: 37.572976, longitude: 126.976759, memo: "도심 속 열린 광장")
            ]
        ),
        DailyPlan(
            date: Date.fromString("2024-09-21")!,
            places: [
                Place(name: "남산서울타워", latitude: 37.551168, longitude: 126.988228, memo: "서울의 전경을 볼 수 있는 곳"),
                Place(name: "명동", latitude: 37.563692, longitude: 126.983238, memo: "쇼핑의 중심지")
            ]
        ),
        DailyPlan(
            date: Date.fromString("2024-09-22")!,
            places: [
                Place(name: "홍대", latitude: 37.557192, longitude: 126.925381, memo: "젊음의 거리"),
                Place(name: "여의도 한강공원", latitude: 37.528076, longitude: 126.934017, memo: "한강에서 휴식")
            ]
        ),
        DailyPlan(
            date: Date.fromString("2024-09-23")!,
            places: [
                Place(name: "북촌한옥마을", latitude: 37.582978, longitude: 126.983661, memo: "전통 한옥 체험"),
                Place(name: "인사동", latitude: 37.574427, longitude: 126.983933, memo: "전통문화의 중심지")
            ]
        )
    ]
)
