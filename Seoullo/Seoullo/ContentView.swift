//
//  ContentView.swift
//  Seoullo
//
//  Created by 이유경 on 9/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//                .foregroundStyle(.point)
//        }
//        .padding()
        CourseSelectMainView(currentTab: .course)

//        TripManageView()
//        DetailMainView()
    }
}

#Preview {
    ContentView()
}
