//
//  ZakFitApp.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 03/12/2025.
//

import SwiftUI
import Observation

@main
struct ZakFitApp: App {
    @State private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            if appState.isLoggedIn {
                TabBarView()
                    .environment(appState)
            } else {
                LoginView(appState: appState)
                    .environment(appState)
            }
        }
    }
}
