//
//  UserService.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import Foundation

class UserService {
    func fetchUserData() async throws -> User {
        guard let url = URL(string: "\(APIConstants.baseURL)/users/profile/info") else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let token = KeychainService.shared.getToken(forKey: "userToken") {
            request
                .setValue(
                    "Bearer \(token)",
                    forHTTPHeaderField: "Authorization"
                )
        }
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(User.self, from: data)
    }
}
