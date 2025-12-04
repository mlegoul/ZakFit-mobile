//
//  ProfileViewModel.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import Foundation

@Observable
class ProfileViewModel {
    var isLoading = false
    var errorMessage: String?
    var isDeleted = false
    
    private let appState: AppState
    private let profileService: ProfileService
    
    init(appState: AppState) {
        self.appState = appState
        self.profileService = ProfileService(appState: appState)
    }
    
    func deleteUser() async -> Bool {
        await MainActor.run {
            self.isLoading = true
            self.errorMessage = nil
        }
        
        do {
            let success = try await profileService.deleteUser()

            if success {
                let keychainSuccess = KeychainService.shared.deleteToken(
                    forKey: "userToken"
                )
                if !keychainSuccess {
                    print(
                        "Erreur : Impossible de supprimer le token de la Keychain."
                    )
                }
                
                await MainActor.run {
                    self.isDeleted = true
                    self.isLoading = false
                    appState.token = nil
                    appState.isLoggedIn = false
                    appState.user = nil
                }
                return true
            } else {
                await MainActor.run {
                    self.errorMessage = "Erreur lors de la suppression du compte."
                    self.isLoading = false
                }
                return false
            }
        } catch let error as NetworkError {
            await MainActor.run {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
            return false
        } catch {
            await MainActor.run {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
            return false
        }
    }
    
    func logout() async {
        let keychainSuccess = KeychainService.shared.deleteToken(
            forKey: "userToken"
        )
        if !keychainSuccess {
            print("Erreur : Impossible de supprimer le token de la Keychain.")
        }
        
        appState.token = nil
        appState.isLoggedIn = false
        appState.user = nil
    }
}
