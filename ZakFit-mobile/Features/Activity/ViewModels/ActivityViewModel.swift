//
//  ActivityViewModel.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import Foundation

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
    
    func submitActivity() async {
        isLoading = true
        errorMessage = nil
                
        let activityData = [
            "type": type.backendValue,
            "duration": duration,
            "calories": calories
        ] as [String: Any]
                
        do {
            try await ActivityService().postActivity(
                activityData: activityData,
                token: appState.token
            )
        } catch {
            errorMessage = error.localizedDescription
            print("Erreur lors de l'envoi : \(error.localizedDescription)")
        }
        isLoading = false
    }
}
