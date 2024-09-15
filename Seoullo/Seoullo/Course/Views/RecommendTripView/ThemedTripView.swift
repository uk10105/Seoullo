//
//  ThemedTripView.swift
//  Seoullo
//
//  Created by 한유진 on 9/15/24.
//

import SwiftUI

struct ThemedTripView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("카테고리 별 코스")
                        .font(.title)
                    Text("카테고리 별 코스를 여행하세요.")
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
                                Text("가족 코스")
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
    ThemedTripView()
}
