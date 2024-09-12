//
//  CourseSelectMainView.swift
//  Seoullo
//
//  Created by 이유경 on 9/12/24.
//

import SwiftUI

struct CourseSelectMainView: View {
    @State var currentTab: Int
    let courseTabOptions: [String] = CourseTabOptions.allCases.map{ $0.rawValue }
    
    var body: some View {
        HStack {
                ForEach(courseTabOptions.indices, id: \.self) { index in
                    let title = courseTabOptions[index]
                    CourseTabItem(currentTab: $currentTab, title: title, tab: index)
                }
            }
            .padding(.horizontal)
        .background(.white)
        .frame(height: 40)
        .frame(width: .infinity)
    }
}

#Preview {
    CourseSelectMainView(currentTab: 0)
}
