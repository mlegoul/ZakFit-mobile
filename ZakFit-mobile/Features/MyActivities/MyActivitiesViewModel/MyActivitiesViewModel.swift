//
//  MyActivitiesViewModel.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import Foundation
import Observation

@Observable
class MyActivitiesViewModel {
    var activities: [MyActivities] = []
    var isLoading = false
    var error: Error?
    
    private let service: MyActivitiesService
    
    init(appState: AppState) {
        self.service = MyActivitiesService(appState: appState)
    }
    
    func fetchActivities() async {
        isLoading = true
        error = nil
        do {
            activities = try await service.fetchActivities()
        } catch {
            self.error = error
        }
        isLoading = false
    }
}
