//
//  MealService.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import Foundation

class MealService {
    
    func addMeal(meal: Meal, token: String?) async throws {
        guard let url = URL(string: "http://localhost:8080/meals") else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
        
        request.httpBody = try JSONEncoder().encode(meal)
        
        let (_, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.requestFailed
        }
    }

}
