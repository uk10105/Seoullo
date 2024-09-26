//
//  CulturalModalView.swift
//  Seoullo
//
//  Created by 이유경 on 9/22/24.
//

import SwiftUI

struct CulturalModalView: View {
    @EnvironmentObject var commonVM: CommonViewModel
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 2.5)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 80, height: 5)
                .padding(.top, 12)
                .padding(.bottom, 20)
            
            // Location Info
            LocationInfoView()
                .environmentObject(commonVM)
                .padding()
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

#Preview {
    CulturalModalView()
        .environmentObject(CommonViewModel())
}
