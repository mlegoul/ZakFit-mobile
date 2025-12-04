//
//  MyMeal.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import Foundation

struct MyFoodItem: Codable, Identifiable {
    let id: UUID
    let carbs: Double
    let name: String
    let consumedQuantity: Double
    let calories: Double
    let proteins: Double
    let fats: Double
}

struct MealRecord: Codable, Identifiable {
    let id: UUID
    let type: String
    let foodItems: [MyFoodItem]
    let date: Date
    let calories: Double
}
