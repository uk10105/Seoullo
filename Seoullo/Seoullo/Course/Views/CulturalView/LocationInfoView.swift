//
//  LocationInfoView.swift
//  Seoullo
//
//  Created by 이유경 on 9/22/24.
//

import SwiftUI
import Kingfisher

struct LocationInfoView: View {
    @State private var isPushed: Bool = false
    var body: some View {
        ScrollView {
            ForEach(commonDummy, id: \.id) { item in
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
                        KFImage(URL(string: item.firstImage))
                            .resizable()
                            .frame(width: 130, height: 100)
                            .scaledToFill()
                        
                        Button(action: {
                            // TODO: 찜 기능 추가
                            isPushed.toggle()
                        }, label: {
                            Image(systemName: isPushed ? "heart.fill" : "heart")
                                .foregroundStyle(.pink)
                                .bold()
                                .padding(.top, 8)
                                .padding(.trailing, 8)
                        })
                        
                    }
                }
            }
        }
    }
}

#Preview {
    LocationInfoView()
}
