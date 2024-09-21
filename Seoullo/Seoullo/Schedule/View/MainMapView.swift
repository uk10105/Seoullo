//
//  MainMapView.swift
//  Seoullo
//
//  Created by 김혜수 on 9/19/24.
//

import SwiftUI
import MapKit

struct MainMapView: View {
    @State private var searchText: String = ""
    @State private var mapCameraPosition: MapCameraPosition = .automatic
    @State private var selectedDate: Date?

    var body: some View {
        ZStack {
            Map(position: $mapCameraPosition) {
                ForEach(selectedPlaces) { place in
                    Annotation(place.name, coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)) {
                        VStack {
                            Image(systemName: "flag.fill")
                                .foregroundColor(.red)
                            Text(place.name)
                                .font(.caption)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(4)
                        }
                    }
                }
                if selectedPlaces.count >= 2 {
                    MapPolyline(coordinates: selectedPlaces.map { CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude) })
                        .stroke(.blue, lineWidth: 3)
                }
            }
            VStack {
                SearchBarView(searchText: $searchText) {
                    // 검색 로직 구현
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(dummyTrip.dailyPlans ?? [], id: \.date) { dailyPlan in
                            Button(action: {
                                selectedDate = dailyPlan.date
                                updateRegion(for: dailyPlan.places)
                            }) {
                                Text(formatDateButton(dailyPlan.date))
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(selectedDate == dailyPlan.date ? .point : .grayApp)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                Spacer()
            }
            .padding(.top, 50)
            .padding(.horizontal, 25)
        }
        .edgesIgnoringSafeArea(.all)
    }

    private var selectedPlaces: [Place] {
        guard let selectedDate = selectedDate else { return [] }
        return dummyTrip.dailyPlans?.first(where: { $0.date == selectedDate })?.places ?? []
    }

    private func formatDateButton(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd"
        return formatter.string(from: date)
    }

    private func updateRegion(for places: [Place]) {
        guard !places.isEmpty else { return }
        let coordinates = places.map { CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude) }
        let minLat = coordinates.map { $0.latitude }.min() ?? 0
        let maxLat = coordinates.map { $0.latitude }.max() ?? 0
        let minLon = coordinates.map { $0.longitude }.min() ?? 0
        let maxLon = coordinates.map { $0.longitude }.max() ?? 0

        let center = CLLocationCoordinate2D(latitude: (minLat + maxLat) / 2, longitude: (minLon + maxLon) / 2)
        let span = MKCoordinateSpan(latitudeDelta: (maxLat - minLat) * 1.5, longitudeDelta: (maxLon - minLon) * 1.5)
    }
}

#Preview {
    MainMapView()
}
