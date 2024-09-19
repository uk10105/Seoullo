//
//  CalendarView.swift
//  Seoullo
//
//  Created by 김혜수 on 9/15/24.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedDates: Set<Date> = []
    @State private var currentDate: Date = Date()

    let calendar = Calendar.current

    var body: some View {
        VStack {
            HStack {
                Text("일정 추가")
                    .font(.system(size: 26, weight: .semibold))
                Spacer()
            }
            ZStack {
                ScrollView {
                    LazyVStack {
                        ForEach(0..<24) { index in
                            if let date = calendar.date(byAdding: .month, value: index, to: currentDate.startOfMonth()) {
                                monthView(for: date)
                            }
                        }
                    }
                }
                VStack {
                    Spacer()
                    Button(action: {
                        // TODO:  - 다음 뷰로 이동
                    }, label: {
                        Text(formatSelectedDates())
                            .font(.system(size: 18, weight: .semibold))
                    })
                    .buttonStyle(ScheduleMainButtonStyle())
                }
            }
        }
        .padding(.horizontal, 25)
    }

    func monthView(for date: Date) -> some View {
        let days = daysInMonth(date)
        let columns = Array(repeating: GridItem(.flexible()), count: 7)

        return VStack {
            HStack {
                Text(monthYearString(from: date))
                    .font(.headline)
                Spacer()
            }

            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(days, id: \.self) { day in
                    if let date = day {
                        DayView(date: date, selectionState: selectionState(for: date)) {
                            dateSelected(date)
                        }
                    } else {
                        Color.clear
                    }
                }
            }
        }
        .padding()
    }

    func dateSelected(_ date: Date) {
        if selectedDates.contains(date) {
            selectedDates.remove(date)
        } else {
            if selectedDates.count == 2 {
                selectedDates.removeAll()
            }
            selectedDates.insert(date)
        }
    }

    func selectionState(for date: Date) -> DayView.SelectionState {
        if selectedDates.contains(date) {
            return .selected
        } else if selectedDates.count == 2 &&
                  date > selectedDates.min()! &&
                  date < selectedDates.max()! {
            return .inRange
        } else {
            return .none
        }
    }

    func daysInMonth(_ date: Date) -> [Date?] {
        guard let range = calendar.range(of: .day, in: .month, for: date) else { return [] }
        let days = range.count

        let firstWeekday = calendar.component(.weekday, from: date)
        let leadingEmptyDays = (firstWeekday - calendar.firstWeekday + 7) % 7

        var result: [Date?] = Array(repeating: nil, count: leadingEmptyDays)

        for day in 1...days {
            if let date = calendar.date(byAdding: .day, value: day - 1, to: date.startOfMonth()) {
                result.append(date)
            }
        }

        return result
    }

    func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월"
        return formatter.string(from: date)
    }

    func formatSelectedDates() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 d일"

        if selectedDates.isEmpty {
            return "날짜를 선택해주세요"
        } else if selectedDates.count == 1 {
            let date = selectedDates.first!
            return dateFormatter.string(from: date) + " 당일치기"
        } else {
            let sortedDates = selectedDates.sorted()
            let startDate = sortedDates.first!
            let endDate = sortedDates.last!

            if Calendar.current.isDate(startDate, equalTo: endDate, toGranularity: .year) {
                dateFormatter.dateFormat = "yyyy년 MM월 d일"
                let startString = dateFormatter.string(from: startDate)
                dateFormatter.dateFormat = "MM월 d일"
                let endString = dateFormatter.string(from: endDate)
                return "\(startString) - \(endString)"
            } else {
                return "\(dateFormatter.string(from: startDate)) - \(dateFormatter.string(from: endDate))"
            }
        }
    }
}

struct DayView: View {
    enum SelectionState {
        case none, selected, inRange
    }

    let date: Date
    let selectionState: SelectionState
    let action: () -> Void

    var body: some View {
        Text("\(Calendar.current.component(.day, from: date))")
            .frame(width: 30, height: 30)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .clipShape(Circle())
            .onTapGesture(perform: action)
    }

    private var backgroundColor: Color {
        switch selectionState {
        case .selected:
            return .point
        case .inRange:
            return .point.opacity(0.3)
        case .none:
            return .clear
        }
    }

    private var foregroundColor: Color {
        switch selectionState {
        case .selected:
            return .white
        case .inRange, .none:
            return .primary
        }
    }
}

extension Date {
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self)) ?? self
    }
}

#Preview {
    CalendarView()
}
