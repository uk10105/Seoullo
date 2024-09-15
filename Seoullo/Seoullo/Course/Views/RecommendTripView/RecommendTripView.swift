//
//  RecommendTripView.swift
//  Seoullo
//
//  Created by 한유진 on 9/15/24.
//

import SwiftUI

struct RecommendTripView: View {
    var body: some View {
        VStack {
            TodaysTripView()
                .padding(.bottom, 20)
            TrendingTripView()
                .padding(.bottom, 20)
            ThemedTripView()
                .padding(.bottom, 20)
        }
        .padding(25)
    }
}

#Preview {
    RecommendTripView()
}
