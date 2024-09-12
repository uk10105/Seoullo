//
//  SchedulePlaceDetailView.swift
//  Seoullo
//
//  Created by 김혜수 on 9/11/24.
//

import SwiftUI

struct SchedulePlaceDetailView: View {
    var title: String
    var subTitle: String?
    var pinColor: Color = .black
    @Binding var memo: String

    var body: some View {

        HStack {
            VStack {
                Image(systemName: "mappin.and.ellipse")
                    .font(.system(size: 25))
                    .foregroundStyle(pinColor)
                Spacer()
            }
            VStack {
                HStack(spacing: 12) {
                    Text(title)
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                    if let subTitle {
                        Text(subTitle)
                            .font(.system(size: 12))
                            .foregroundStyle(.white)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(pinColor)
                            )
                    }
                }
                TextField("", text: $memo)
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.grayApp)
                    )
                Spacer()
            }
        }
        .padding(.horizontal, 25)
    }
}

#Preview {
    SchedulePlaceDetailView(title: "남산타워", subTitle: "00콘서트로 많은 인파 예상", pinColor: .redPin, memo: .constant("12:00"))
}
