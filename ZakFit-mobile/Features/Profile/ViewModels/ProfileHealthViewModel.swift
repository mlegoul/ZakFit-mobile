//
//  ProfileHealthViewModel.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 05/12/2025.
//

import Foundation
import Observation

@Observable
class ProfileHealthViewModel {
    var lastName: String = ""
    var firstName: String = ""
    var email: String = ""
    var password: String = ""
    
    var isLoading: Bool = false
    var errorMessage: String?
    var successMessage: String?
    
    private let profileService: ProfileDataService
    
    init(appState: AppState) {
        self.profileService = ProfileDataService(appState: appState)
    }
    
    func updateProfile() async {
        isLoading = true
        errorMessage = nil
        successMessage = nil
        
        print("[DEBUG] Début de la mise à jour du profil...")
        
        let profileData = [
            "last_name": lastName,
            "first_name": firstName,
            "email": email,
            "password": password
        ]
        
        print("[DEBUG] Données à envoyer : \(profileData)")
        
        do {
            print("[DEBUG] Appel du service pour PATCH /users/profile/info")
            let success = try await profileService.updateProfile(
                data: profileData
            )
            
            if success {
                successMessage = "Profil mis à jour avec succès !"
                print("[DEBUG] Succès : Profil mis à jour.")
                
            }
        } catch let error as NetworkError {
            print("[DEBUG] Erreur réseau : \(error)")
        } catch {
            errorMessage = error.localizedDescription
            print("[DEBUG] Erreur inattendue : \(error)")
        }
        
        DispatchQueue.main.async {
            self.password = ""
        }
        
        isLoading = false
        print("[DEBUG] Fin de la mise à jour du profil.")
    }
}
