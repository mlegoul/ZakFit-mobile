//
//  ProfileDataService.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 05/12/2025.
//

import Foundation

final class ProfileDataService {
    private let appState: AppState
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func updateProfile(data: [String: String]) async throws -> Bool {
        let urlString = "\(APIConstants.baseURL)/users/profile/info"
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Vérification et ajout du token
        guard let token = appState.token, !token.isEmpty else {
            throw NetworkError.unauthorized
        }
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        // Encodage du body en JSON
        let jsonData = try JSONSerialization.data(withJSONObject: data)
        
        // Utilisation de `upload(for:from:)` CORRECTEMENT (sans définir `httpBody`)
        let (data, response) = try await URLSession.shared.upload(
            for: request,
            from: jsonData  // Le body est passé ici, pas dans `httpBody`
        )
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        // Debug
        print("Status code: \(httpResponse.statusCode)")
        if let responseBody = String(data: data, encoding: .utf8) {
            print("Response: \(responseBody)")
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.requestFailed
        }
        
        return true
    }
}
