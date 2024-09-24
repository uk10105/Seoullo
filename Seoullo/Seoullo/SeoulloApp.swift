//
//  SeoulloApp.swift
//  Seoullo
//
//  Created by 이유경 on 9/7/24.
//

import SwiftUI

@main
struct SeoulloApp: App {
    @StateObject var commonVM  = CommonViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(commonVM)
        }
    }
}

