//
//  HW_3_3App.swift
//  HW_3.3
//
//  Created by Maxim Mitin on 14.09.21.
//

import SwiftUI

@main
struct HW_3_3App: App {
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
        }
    }
}
