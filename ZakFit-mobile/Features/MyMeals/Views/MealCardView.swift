//
//  MealCardView.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import SwiftUI

struct MealCardView: View {
    let meal: MealRecord
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(meal.type)
                    .font(.custom("Lexend-Medium", size: 18))
                Spacer()
                Text(meal.date, style: .date)
                    .font(.custom("Lexend-Light", size: 14))
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 20)

            VStack(alignment: .leading, spacing: 6) {
                ForEach(
                    Array(meal.foodItems.enumerated()),
                    id: \.offset
                ) {
                    _,
                    food in
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 6))
                            .foregroundColor(.gray)
                        Text(
                            "\(food.name.capitalized) (\(Int(food.consumedQuantity)) g)"
                        )
                        .font(.custom("Lexend-Light", size: 14))
                        Spacer()
                        VStack(alignment: .trailing, spacing: 2) {
                            Text("\(Int(food.calories)) kcal")
                                .font(.custom("Lexend-Light", size: 12))
                            HStack(spacing: 6) {
                                Text("C: \(Int(food.carbs))g")
                                Text("P: \(Int(food.proteins))g")
                                Text("L: \(Int(food.fats))g")
                            }
                            .font(.custom("Lexend-Light", size: 10))
                            .foregroundColor(.gray)
                        }
                    }
                }
            }
            
            Divider()
            
            HStack {
                Spacer()
                Text("Total: \(Int(meal.calories)) kcal")
                    .font(.custom("Lexend-Medium", size: 14))
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.1), lineWidth: 1)
        )
    }
}


#Preview {
    let exampleFoodItem = MyFoodItem(
        id: UUID(uuidString: "C513C3EC-F191-4577-A5B7-A6548AD9D9F0") ?? UUID(),
        carbs: 29.6,
        name: "apple",
        consumedQuantity: 50,
        calories: 213,
        proteins: 2.8,
        fats: 8.7
    )
    
    let exampleMeal = MealRecord(
        id: UUID(uuidString: "1910DA86-0720-4940-8EE9-13F0B887D787") ?? UUID(),
        type: "Collation",
        foodItems: [exampleFoodItem],
        date: Date(timeIntervalSince1970: 1733155200),
        calories: 213
    )
    
    return MealCardView(meal: exampleMeal)
}
