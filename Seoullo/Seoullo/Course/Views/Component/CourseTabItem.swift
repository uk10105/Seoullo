//
//  CourseTabItem.swift
//  Seoullo
//
//  Created by 이유경 on 9/12/24.
//

import SwiftUI

struct CourseTabItem: View {
    @Binding var currentTab: CourseTabOptions
    var tab: CourseTabOptions
    
    var body: some View {
        Button(action: {
            currentTab = tab
        }, label: {
            VStack {
                Text(tab.rawValue)
                    .foregroundStyle(currentTab == tab ? .blackText : .grayApp)
                    .font(.headline)
                    .frame(width: 100)
                    .bold()
                Rectangle()
                    .frame(width: 100, height: 5)
                    .foregroundStyle(currentTab == tab ? .black : .clear)
            }
            .animation(.spring(), value: currentTab)
            .padding()
        })
        .buttonStyle(.plain)
    }
}

#Preview {
    CourseTabItem(currentTab: .constant(.course), tab: .course)
}
