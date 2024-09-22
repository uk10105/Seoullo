//
//  TripManageView.swift
//  Seoullo
//
//  Created by 김혜수 on 9/22/24.
//

import SwiftUI

struct TripManageView: View {
    @State private var currentTrip: Trip?
    @State private var upcomingTrips: [Trip] = []
    @State private var pastTrips: [Trip] = []

    var body: some View {

        VStack {
            HStack {
                Text("내 여행")
                    .font(.title)
                    .bold()
                Spacer()
            }
            .padding(.horizontal, 25)

            List {
                if let current = currentTrip {
                    Section(header: Text("현재 여행")
                        .font(.headline)
                        .foregroundStyle(.blackText)
                        .fontWeight(.semibold)
                    ) {
                        TripRowView(trip: current)
                    }
                }

                if !upcomingTrips.isEmpty {
                    Section(header: Text("다가오는 여행")
                        .font(.headline)
                        .foregroundStyle(.blackText)
                        .fontWeight(.semibold)
                    ) {
                        ForEach(upcomingTrips) { trip in
                            TripRowView(trip: trip)
                        }
                    }
                }

                if !pastTrips.isEmpty {
                    Section(header: Text("지난 여행")
                        .font(.headline)
                        .foregroundStyle(.blackText)
                        .fontWeight(.semibold)
                    ) {
                        ForEach(pastTrips) { trip in
                            TripRowView(trip: trip)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .onAppear {
                let classified = classifyTrips(dummyTrips)
                currentTrip = classified.current
                upcomingTrips = classified.upcoming
                pastTrips = classified.past
            }
        }
    }

    func classifyTrips(_ trips: [Trip], currentDate: Date = Date()) -> (current: Trip?, upcoming: [Trip], past: [Trip]) {
        let calendar = Calendar.current
        let currentDateWithoutTime = calendar.startOfDay(for: currentDate)

        let sortedTrips = trips.sorted { $0.startDate < $1.startDate }

        var currentTrip: Trip? = nil
        var upcomingTrips: [Trip] = []
        var pastTrips: [Trip] = []

        for trip in sortedTrips {
            let tripStartDateWithoutTime = calendar.startOfDay(for: trip.startDate)
            let tripEndDateWithoutTime = calendar.startOfDay(for: trip.endDate)

            if currentDateWithoutTime >= tripStartDateWithoutTime && currentDateWithoutTime <= tripEndDateWithoutTime {
                currentTrip = trip
            } else if currentDateWithoutTime < tripStartDateWithoutTime {
                upcomingTrips.append(trip)
            } else if currentDateWithoutTime > tripEndDateWithoutTime {
                pastTrips.append(trip)
            }
        }

        return (currentTrip, upcomingTrips, pastTrips)
    }
}

struct TripRowView: View {
    let trip: Trip

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("\(trip.startDate.formatToString()) - \(trip.endDate.formatToString())")
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    TripManageView()
}
