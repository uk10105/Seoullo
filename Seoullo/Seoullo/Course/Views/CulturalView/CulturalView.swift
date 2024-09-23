//
//  CulturalView.swift
//  Seoullo
//
//  Created by 한유진 on 9/15/24.
//

import SwiftUI
import MapKit

struct CulturalView: View {
    @State private var searchText = ""
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780), // Seoul coordinates
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @State private var modalOffset: CGFloat = UIScreen.main.bounds.height * 0.7
    @State private var lastDragPosition: CGFloat = 10.0
    
    var body: some View {
        ZStack(alignment: .top) {
            // Map View with annotations
            Map(coordinateRegion: $region, annotationItems: commonDummy) { item in
                MapAnnotation(coordinate: CLLocationCoordinate2D(
                    latitude: Double(item.mapy) ?? 0.0,
                    longitude: Double(item.mapx) ?? 0.0
                )) {
                    // Customize the marker
                    VStack {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(.red)
                            .font(.title)
                        Text(item.title)
                            .font(.caption)
                            .padding(4)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 3)
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            CategoryButton()
                .padding(.vertical,20)
            
            // Modal View with Search and Location Info
            CulturalModalView()
                .offset(y: modalOffset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let dragAmount = value.translation.height - self.lastDragPosition
                            if self.modalOffset + dragAmount >= 0 {
                                self.modalOffset += dragAmount
                            }
                            self.lastDragPosition = value.translation.height
                        }
                        .onEnded { value in
                            self.lastDragPosition = 0
                            if self.modalOffset > UIScreen.main.bounds.height * 0.75 {
                                self.modalOffset = UIScreen.main.bounds.height * 0.85 // Almost hidden
                            } else if self.modalOffset < UIScreen.main.bounds.height * 0.25 {
                                self.modalOffset = 0 // Fully visible
                            } else {
                                self.modalOffset = UIScreen.main.bounds.height * 0.5 // Half visible
                            }
                        }
                )
                .animation(.spring())
        }
    }
}



#Preview {
    CulturalView()
}
