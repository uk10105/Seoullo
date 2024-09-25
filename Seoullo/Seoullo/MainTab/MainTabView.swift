//
//  MainTabView.swift
//  Seoullo
//
//  Created by 김혜수 on 9/25/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: MainTabType = .map
    var body: some View {
        TabView(selection: $selectedTab,
                content:  {
            ForEach(MainTabType.allCases, id: \.self) { tab in
                Group {
                    switch tab {
                    case .bookmark:
                        TripManageView()
                    case .map:
                        MainMapView()
                    case .flag:
                        CourseSelectMainView(currentTab: .course)
                    }
                }
                .tabItem {
                    Label(tab.title, systemImage: tab.imageName(selected: selectedTab == tab))
                }
                .tag(tab)
            }
        })
        .tint(.point)
    }
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(.blackText)
    }
}

#Preview {
    MainTabView()
}
