//
//  MyMealsViewModel.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import Foundation
import Observation

@Observable
final class MyMealsViewModel {

    var meals: [MealRecord] = []
    var isLoading: Bool = false
    var error: Error?
    
    private let myMealService: MyMealsService
    
    init(appState: AppState) {
        self.myMealService = MyMealsService(appState: appState)
    }
    
    // MARK: - Public Methods
    func fetchMeals() async {
        isLoading = true
        error = nil
        do {
            meals = try await myMealService.fetchMyMeals()
        } catch {
            self.error = error
            print("Error fetching meals: \(error.localizedDescription)")
        }
        isLoading = false
    }
}
