//
//  LocationInfoView.swift
//  Seoullo
//
//  Created by 이유경 on 9/22/24.
//

import SwiftUI
import Kingfisher

struct LocationInfoView: View {
    @EnvironmentObject var commonVM: CommonViewModel
    
    var body: some View {
        ScrollView {
            if commonVM.currentItems.isEmpty {
                Text("선택된 카테고리의 데이터가 없습니다.")
                    .padding()
            } else {
//                LazyVStack {
                    ForEach(commonVM.currentItems, id: \.id) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                    .padding(.vertical, 20)
                                Text(item.addr)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            ZStack(alignment: .topTrailing) {
                                if let imageUrl = URL(string: item.firstImage ?? "") {
                                    KFImage(imageUrl)
                                        .resizable()
                                        .frame(width: 130, height: 100)
                                        .scaledToFill()
                                } else {
                                    Image(systemName: "photo")
                                        .font(.title)
                                        .foregroundColor(.gray)
                                        .frame(width: 130, height: 100)
                                }
                            }
                        }
                    }
                }
//            }
        }
    }
}


#Preview {
    LocationInfoView()
        .environmentObject(CommonViewModel())
}
