//
//  User.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 03/12/2025.
//

import Foundation

struct LoginResponse: Codable {
    let token: String
}

struct User: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
}
