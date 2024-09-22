//
//  CourseSelectMainView.swift
//  Seoullo
//
//  Created by 이유경 on 9/12/24.
//

import SwiftUI

struct CourseSelectMainView: View {
    @State var currentTab: CourseTabOptions
    
    var body: some View {
        VStack {
            HStack {
                ForEach(CourseTabOptions.allCases, id: \.self) { index in
                    CourseTabItem(currentTab: $currentTab, tab: index)
                }
            }
            .padding(.horizontal, 25)
            .background(.white)
        .frame(height: 40)
            
            switch currentTab {
            case .course:
                RecommendTripView()
            case .hotPlace:
                HotSpotView()
            case .festival:
                FestivalView()
            case .culture:
                CulturalView()
            }
        }
    }
}

#Preview {
    CourseSelectMainView(currentTab: .course)
}
