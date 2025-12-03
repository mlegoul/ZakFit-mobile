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
    var email: String = ""
    var password: String = ""
    var errorMessage: String?
    var isLoading = false
    
    
    func login() async {
        isLoading = true
        errorMessage = nil
        
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Veuillez remplir tous les champs."
            return
        }
        isLoading = false
    }
}
