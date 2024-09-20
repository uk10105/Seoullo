//
//  MainMapView.swift
//  Seoullo
//
//  Created by 김혜수 on 9/19/24.
//

import SwiftUI
import MapKit

struct MainMapView: View {
    var body: some View {
        ZStack {
            Map()
            VStack {
                SearchBarView(searchText: .constant("")) {
                    
                }
                ScrollView(.horizontal) {
                    Button("09.10") {
                        // TODO:  - 해당 날짜의 장소 핀 표시
                    }.buttonStyle(ScheduleSubButtonStyle())
                }.statusBar(hidden: true)
                Spacer()
            }
            .padding(.horizontal, 25)
        }
    }
}

#Preview {
    MainMapView()
}
