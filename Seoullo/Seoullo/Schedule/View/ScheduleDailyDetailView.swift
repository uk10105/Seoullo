//
//  ScheduleDailyDetailView.swift
//  Seoullo
//
//  Created by 김혜수 on 9/25/24.
//

import SwiftUI

struct ScheduleDailyDetailView: View {
    let trip: Trip
    @State private var selectedDate: Date?
    @State private var currentWeekStart: Date
    @State private var weekOffset: Int = 0

    init(trip: Trip) {
        self.trip = trip
        _currentWeekStart = State(initialValue: trip.startDate.startOfWeek)
    }

    private var calendar: Calendar {
        var calendar = Calendar.current
        calendar.firstWeekday = 1
        return calendar
    }

    var body: some View {
        VStack {
            Text(currentWeekStart.formatted(date: .abbreviated, time: .omitted))
                .font(.headline)
                .padding(.top)

            weekView

            if let selectedDate = selectedDate,
               let dailyPlan = trip.dailyPlans?.first(where: { calendar.isDate($0.date, inSameDayAs: selectedDate) }) {
                placesList(for: dailyPlan)
            }
        }
    }

    private var weekView: some View {
        VStack(spacing: 8) {
            HStack {
                ForEach(calendar.shortWeekdaySymbols, id: \.self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                }
            }

            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(weekDates(), id: \.self) { week in
                            weekContent(for: week)
                                .frame(width: geometry.size.width)
                        }
                    }
                }
                .content.offset(x: CGFloat(weekOffset) * -geometry.size.width)
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            let threshold = geometry.size.width / 3
                            if value.translation.width > threshold {
                                previousWeek()
                            } else if value.translation.width < -threshold {
                                nextWeek()
                            }
                        }
                )
            }
            .frame(height: 60)
        }
        .padding()
    }

    private func weekContent(for week: [Date]) -> some View {
        HStack {
            ForEach(week, id: \.self) { date in
                Text(dayText(for: date))
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .background(colorForDate(date))
                    .clipShape(Circle())
                    .onTapGesture {
                        if isDateSelectable(date) {
                            selectedDate = date
                        }
                    }
            }
        }
    }

    private func placesList(for dailyPlan: DailyPlan) -> some View {
        List(dailyPlan.places) { place in
            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.headline)
                Text(place.memo ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }

    private func dayText(for date: Date) -> String {
        let components = calendar.dateComponents([.day], from: date)
        return "\(components.day ?? 0)"
    }

    private func colorForDate(_ date: Date) -> Color {
        if !isDateSelectable(date) {
            return .gray.opacity(0.1)
        } else if calendar.isDate(date, inSameDayAs: selectedDate ?? Date()) {
            return .blue.opacity(0.3)
        } else if ((trip.dailyPlans?.contains(where: { calendar.isDate($0.date, inSameDayAs: date) })) != nil) {
            return .green.opacity(0.3)
        } else {
            return .gray.opacity(0.1)
        }
    }

    private func isDateSelectable(_ date: Date) -> Bool {
        return date >= trip.startDate && date <= trip.endDate
    }

    private func weekDates() -> [[Date]] {
        let numberOfWeeks = calendar.dateComponents([.weekOfYear], from: trip.startDate, to: trip.endDate).weekOfYear ?? 0
        return (0...numberOfWeeks).map { weekOffset in
            let weekStart = calendar.date(byAdding: .weekOfYear, value: weekOffset, to: trip.startDate.startOfWeek)!
            return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: weekStart) }
        }
    }

    private func nextWeek() {
        if let nextWeek = calendar.date(byAdding: .weekOfYear, value: 1, to: currentWeekStart),
           nextWeek <= trip.endDate.startOfWeek {
            withAnimation {
                currentWeekStart = nextWeek
                weekOffset += 1
            }
        }
    }

    private func previousWeek() {
        if let previousWeek = calendar.date(byAdding: .weekOfYear, value: -1, to: currentWeekStart),
           previousWeek >= trip.startDate.startOfWeek {
            withAnimation {
                currentWeekStart = previousWeek
                weekOffset -= 1
            }
        }
    }
}

extension Date {
    var startOfWeek: Date {
        Calendar.current.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: self).date!
    }
}

#Preview {
    ScheduleDailyDetailView(trip: Trip(
        id: UUID(), startDate: Date.fromString("2024-09-20")!,
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
    ))
}
