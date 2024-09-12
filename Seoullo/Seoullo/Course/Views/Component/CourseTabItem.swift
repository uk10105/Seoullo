//
//  CourseTabItem.swift
//  Seoullo
//
//  Created by 이유경 on 9/12/24.
//

import SwiftUI

struct CourseTabItem: View {
    @Binding var currentTab: Int
    var title: String
    var tab: Int
    
    var body: some View {
        Button(action: {
            currentTab = tab
        }, label: {
            VStack {
                Text(title)
                    .foregroundStyle(.blackText)
                Rectangle()
                    .frame(width: 80, height: 7)
                    .foregroundStyle(currentTab == tab ? .black : .clear)
            }
            .animation(.spring(), value: currentTab)
        })
        .buttonStyle(.plain)
    }
}

#Preview {
    CourseTabItem(currentTab: .constant(0), title: "course", tab: 0)
}
