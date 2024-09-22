//
//  CulturalModalView.swift
//  Seoullo
//
//  Created by 이유경 on 9/22/24.
//

import SwiftUI

struct CulturalModalView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            CategoryButton()
                .padding(.vertical,20)
            
            // Location Info
            LocationInfoView()
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
}
