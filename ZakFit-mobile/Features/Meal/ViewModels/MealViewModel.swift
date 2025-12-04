//
//  MealViewModel.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import Foundation
import Observation

@Observable
class MealViewModel {
    var type: MealType = .breakfast
    var foodName: String = ""
    var quantity: Int = 50
    var isLoading = false
    var errorMessage: String?
    
    private let appState: AppState
    private let mealService: MealService
    
    init(
        appState: AppState,
        mealService: MealService = MealService()
    ) {
        self.appState = appState
        self.mealService = mealService
    }
    
    func submitMeal() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        guard !foodName.isEmpty, quantity > 0 else {
            errorMessage = "Veuillez remplir tous les champs correctement."
            return
        }
        
        let foodItem = FoodItem(name: foodName, consumedQuantity: quantity)
        let meal = Meal(type: type.rawValue, foodItems: [foodItem])
        
        do {
            try await mealService.addMeal(meal: meal, token: appState.token)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
