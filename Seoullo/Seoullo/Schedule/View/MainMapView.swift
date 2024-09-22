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
    @State private var selectedDate: Date? = dummyTrip.dailyPlans?.first?.date
    @State private var modalOffsetY: CGFloat = UIScreen.main.bounds.height - 50
    @State private var selectedDailyPlan: DailyPlan?

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
            VStack(spacing: 8) {
                SearchBarView(searchText: $searchText) {
                    // 검색 로직 구현
                }
                .padding(.top, 8)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(dummyTrip.dailyPlans ?? [], id: \.date) { dailyPlan in
                            Button(action: {
                                selectedDate = dailyPlan.date
                                selectedDailyPlan = dailyPlan
                                moveToFirstPlace(of: dailyPlan)
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

            VStack {
                Spacer()
                MainMapModalView(dailyPlan: Binding(
                    get: { selectedDailyPlan ?? DailyPlan(date: Date(), places: []) },
                    set: { selectedDailyPlan = $0 }
                ))
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(radius: 10)
            }
            .edgesIgnoringSafeArea(.bottom)
            .offset(y: modalOffsetY)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let newOffset = modalOffsetY + value.translation.height
                        modalOffsetY = min(max(newOffset, 0), UIScreen.main.bounds.height - 100)
                    }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            if modalOffsetY < UIScreen.main.bounds.height * 0.5 {
                                modalOffsetY = 0
                            } else {
                                modalOffsetY = UIScreen.main.bounds.height - 100
                            }
                        }
                    }
            )
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            if let firstPlan = dummyTrip.dailyPlans?.first {
                selectedDate = firstPlan.date
                selectedDailyPlan = firstPlan
                moveToFirstPlace(of: firstPlan)
            }
        }
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

    private func moveToFirstPlace(of dailyPlan: DailyPlan) {
        guard let firstPlace = dailyPlan.places.first else { return }
        withAnimation(.easeInOut(duration: 1.0)) {
            mapCameraPosition = .region(MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: firstPlace.latitude, longitude: firstPlace.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007)
            ))
        }
    }
}

#Preview {
    MainMapView()
}
