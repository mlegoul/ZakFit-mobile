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
            appState.token = token
            appState.isLoggedIn = true
        } catch {
            print("Erreur de connexion: \(error)")
        }
    }
}
