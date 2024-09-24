//
//  CategoryButton.swift
//  Seoullo
//
//  Created by 이유경 on 9/22/24.
//

import SwiftUI

enum Category: Int, CaseIterable {
    case food = 39
    case culture = 14
    case trip = 12
    case shopping = 38
    
    var name: String {
        switch self {
        case .food: return "🍴음식"
        case .culture: return "🎭문화"
        case .trip: return "🏛️관광지"
        case .shopping: return  "🛍️쇼핑"
        }
    }
}

struct CategoryButton: View {
    @StateObject var commonVM: CommonViewModel
    @State private var stateText: String = " 지역 "
    
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
                
                ForEach(Category.allCases, id: \.self) { item in
                    Button(action: {
                        commonVM.contentType = item
                        commonVM.getCommon(contentType: item) {
                            
                            print("---------currentItems: \(commonVM.currentItems)")
                        }
                    }) {
                        Text(item.name)
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
    CategoryButton(commonVM: CommonViewModel())
}
