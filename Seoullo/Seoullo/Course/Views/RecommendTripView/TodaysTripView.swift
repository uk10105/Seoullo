//
//  TodaysTripView.swift
//  Seoullo
//
//  Created by 한유진 on 9/15/24.
//

import SwiftUI

extension Int: Identifiable {
    public var id: Int { self }
}

struct TodaysTripView: View {
    @State private var selectedTripIndex: Int?
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("오늘의 추천")
                        .font(.title)
                    Text("오늘의 추천 코스를 여행하세요.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<3) { index in
                        Button(action: {
                            selectedTripIndex = index
                        }) {
                            ZStack(alignment: .bottomLeading) {
                                Image("icybay")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 300, height: 150)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Spacer()
                                        Image(systemName: "heart")
                                    }
                                    Spacer()
                                    Text("Title \(index)")
                                        .font(.headline)
                                    Text("Description")
                                        .font(.footnote)
                                }
                                .foregroundColor(.white)
                                .padding(10)
                                .frame(width: 300, height: 150)
                            }
                            .padding(.trailing, 10)
                        }
                    }
                }
            }
            .sheet(item: $selectedTripIndex) { index in
                TripDetailView()
            }
        }
    }
}

#Preview {
    TodaysTripView()
}
