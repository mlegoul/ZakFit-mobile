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
    
    var selectedTab: Int = 2

    init() {
        self.token = KeychainService.shared.getToken(forKey: "userToken")
        self.isLoggedIn = token != nil
    }
    
    
    
    var token: String? {
        didSet {
            if let token = token {
                _ = KeychainService.shared.saveToken(token, forKey: "userToken")
            } else {
                _ = KeychainService.shared.deleteToken(forKey: "userToken")
            }
        }
    }
    var isLoggedIn: Bool = false {
        didSet {
            if !isLoggedIn {
                token = nil
            }
        }
    }

}
