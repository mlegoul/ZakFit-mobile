//
//  MyActivitiesService.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import Foundation

class MyActivitiesService {
    private let appState: AppState
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func fetchActivities() async throws -> [MyActivities] {
        guard let url = URL(string: "\(APIConstants.baseURL)/activities") else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let token = appState.token {
            request
                .setValue(
                    "Bearer \(token)",
                    forHTTPHeaderField: "Authorization"
                )
        } else {
            throw NetworkError.requestFailed
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Erreur serveur : \(jsonString)")
            }
            throw NetworkError.requestFailed
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            let activities = try decoder.decode([MyActivities].self, from: data)
            return activities
        } catch {
            print("Erreur de décodage : \(error)")
            throw NetworkError.invalidResponse
        }
    }
}
