//
//  LoginViewModel.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 03/12/2025.
//

import Foundation
import Observation

@Observable
final class LoginViewModel {
    private let appState: AppState
    var email: String = ""
    var password: String = ""
    var isLoading = false
    var errorMessage: String?
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func login() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let token = try await AuthService.shared.login(
                email: email,
                password: password
            )
            
            let keychainSuccess = KeychainService.shared.saveToken(token, forKey: "userToken")
            if !keychainSuccess {
                errorMessage = "Impossible de sauvegarder le token."
                return
            }
            
            appState.token = token
            appState.isLoggedIn = true
            appState.loadUser()
            
        } catch {
            errorMessage = "Erreur de connexion : \(error.localizedDescription)"
            print("Erreur de connexion: \(error)")
        }
    }
}
