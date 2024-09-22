//
//  InfoIcon.swift
//  Seoullo
//
//  Created by 이유경 on 9/23/24.
//

import SwiftUI

struct InfoIcon: View {
    var body: some View {
        HStack {
            ForEach(0..<3) { _ in
                ZStack {
                    Circle()
                        .fill(.point.opacity(0.2))
                        .frame(width: 90)
                    Image(systemName: "phone.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.point)
                }
                .padding()
            }
        }
    }
}

#Preview {
    InfoIcon()
}
