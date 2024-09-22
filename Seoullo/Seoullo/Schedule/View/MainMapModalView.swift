//
//  MainMapModalView.swift
//  Seoullo
//
//  Created by 김혜수 on 9/22/24.
//

import SwiftUI

struct MainMapModalView: View {
    @Binding var dailyPlan: DailyPlan

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 2.5)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 80, height: 5)
                .padding(.top, 10)

            HStack {
                Text(dailyPlan.date.formatToString())
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.blackText)
                Spacer()
            }
            .padding(.top, 25)
            .padding(.bottom, 20)

            ScrollView {
                ForEach(dailyPlan.places.indices, id: \.self) { index in
                    SchedulePlaceDetailView(
                        title: dailyPlan.places[index].name,
                        memo: Binding(
                            get: { dailyPlan.places[index].memo ?? "" },
                            set: { dailyPlan.places[index].memo = $0 }
                        )
                    )
                }
            }
            Button("추천 코스 보러가기") {

            }.buttonStyle(ScheduleMainButtonStyle())
        }
        .padding(.horizontal, 25)
    }
}

#Preview {
    MainMapModalView(dailyPlan: .constant(DailyPlan(
        date: Date.fromString("2024-09-20")!,
        places: [
            Place(name: "경복궁", latitude: 37.579617, longitude: 126.977041, memo: "조선의 궁궐"),
            Place(name: "광화문광장", latitude: 37.572976, longitude: 126.976759, memo: "도심 속 열린 광장")
        ]
    )))
}
