//
//  Meal.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import Foundation

struct Meal: Codable {
    let type: String
    let foodItems: [FoodItem]
}

struct FoodItem: Codable {
    let name: String
    let consumedQuantity: Int
}
