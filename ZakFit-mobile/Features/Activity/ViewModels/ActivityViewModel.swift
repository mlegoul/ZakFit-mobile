//
//  ActivityViewModel.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import SwiftUI
import Observation

@Observable
class ActivityViewModel {
    var type: ActivityType = .running
    var duration: Int = 15
    var calories: Int = 750
    var isLoading = false
    var errorMessage: String?
    
    private let appState: AppState
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func submitActivity() {
        isLoading = true
        errorMessage = nil
        
        let activityData = [
            "type": type.backendValue,
            "duration": duration,
            "calories": calories
        ] as [String : Any]
        
        Task {
            do {
                try await ActivityService().postActivity(
                    activityData: activityData,
                    token: appState.token
                )
                print("Activity submitted successfully")
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}
