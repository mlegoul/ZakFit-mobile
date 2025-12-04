//
//  MyMealsService.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import Foundation

final class MyMealsService {
    private let appState: AppState
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func fetchMyMeals() async throws -> [MealRecord] {
        let urlString = "http://localhost:8080/meals/history"
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let token = appState.token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        } else {
            throw NetworkError.unauthorized
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
                        
            if !(200...299).contains(httpResponse.statusCode) {
                let message = String(data: data, encoding: .utf8) ?? "Aucun message"
                throw NetworkError.requestFailed
            }
            
            let jsonString = String(data: data, encoding: .utf8) ?? "Impossible de décoder"
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let meals = try decoder.decode([MealRecord].self, from: data)
                return meals
            } catch {
                throw NetworkError.decodingError
            }
        } catch {
            throw error
        }
    }
}
