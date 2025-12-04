//
//  AppState.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 03/12/2025.
//

import SwiftUI
import Observation
import Combine

@Observable
final class AppState {
    var selectedTab: Int = 0
    var selectedActivity: ActivityType = .running
    var user: User?
    var token: String?
    var isLoggedIn: Bool = false
    
    init() {
        self.token = KeychainService.shared.getToken(forKey: "userToken")
        self.isLoggedIn = token != nil
        if isLoggedIn {
            fetchUserInfo()
        }
    }
    
    func loadUser() {
        self.token = KeychainService.shared.getToken(forKey: "userToken")
        self.isLoggedIn = token != nil
        if isLoggedIn {
            fetchUserInfo()
        }
    }
    
    
    private func fetchUserInfo() {
        Task {
            print("Token utilisé pour fetchUserInfo : \(self.token ?? "nil")")
            do {
                self.user = try await UserService().fetchUserData()
            } catch {
                print("Erreur : \(error)")
            }
        }
    }
}
