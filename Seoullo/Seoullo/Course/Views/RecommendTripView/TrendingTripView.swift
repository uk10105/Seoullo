//
//  TrendingTripView.swift
//  Seoullo
//
//  Created by 한유진 on 9/15/24.
//

import SwiftUI

struct TrendingTripView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("인기 여행 코스")
                        .font(.title)
                    Text("가장 많이 방문하는 코스를 알아보세요.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<3) { index in
                        ZStack(alignment: .bottomLeading) {
                            Image("icybay")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Spacer()
                                    Image(systemName: "heart")
                                }
                                Spacer()
                                Text("\(index)번째 인기 코스")
                                    .font(.title)
                            }
                            .foregroundColor(.white)
                            .padding(10)
                            .frame(width: 150, height: 150)
                        }
                        .padding(.trailing, 10)
                    }
                }
            }
        }
    }
}

#Preview {
    TrendingTripView()
}
