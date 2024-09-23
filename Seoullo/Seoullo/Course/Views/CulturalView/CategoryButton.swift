//
//  CategoryButton.swift
//  Seoullo
//
//  Created by 이유경 on 9/22/24.
//

import SwiftUI


struct CategoryButton: View {
    @State private var showActionSheet = false
    @State private var stateText: String = " 지역 "
    let category = ["☕️카페", "🍴음식", "🎭문화", "🏛️관광지", "🛍️쇼핑"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button {
                    // TODO: 지역구 선택 조회 기능 추가
                } label: {
                    Text(stateText)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .foregroundStyle(.white)
                        .font(.system(size: 12))
                        .bold()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.point)
                        )
                        .cornerRadius(20)
                }.padding(.trailing, 7)
                
                ForEach(category, id: \.self) { item in
                    Button(action: {
                        // TODO: 버튼 액션 연결
                    }) {
                        Text(item)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .foregroundStyle(.blackText)
                            .font(.system(size: 12))
                            .bold()
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .stroke(.point.opacity(0.5), lineWidth: 2.5)
                            )
                            .cornerRadius(20)
                    }
                    
                }
               
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CategoryButton()
}
