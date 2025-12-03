//
//  RegisterViewModel.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 03/12/2025.
//

import Foundation
import Observation

@Observable
final class RegisterViewModel {
    private let appState: AppState
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var password: String = ""
    var passwordConfirmation: String = ""
    var isLoading = false
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func register() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let token = try await AuthService.shared
                .register(
                    firstName: firstName,
                    lastName: lastName,
                    email: email,
                    password: password,
                    passwordConfirmation: passwordConfirmation
                )
            appState.token = token
            appState.isLoggedIn = true
        } catch {
            print("Erreur d'inscription: \(error)")
        }
    }
}
