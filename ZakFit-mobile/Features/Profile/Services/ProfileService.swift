//
//  ProfileService.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import Foundation

class ProfileService {
    private let appState: AppState
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func deleteUser() async throws -> Bool {
        let urlString = "\(APIConstants.baseURL)/users/profile"

        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let token = appState.token else {
            throw NetworkError.unauthorized
        }
        
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, response) = try await URLSession.shared.data(
                for: request
            )
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            if !(200...299).contains(httpResponse.statusCode) {
                _ = String(data: data, encoding: .utf8)
                throw NetworkError.requestFailed
            }
            
            return true
            
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.unknown
        }
    }
}
