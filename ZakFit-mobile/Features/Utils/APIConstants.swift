//
//  APIConstants.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 03/12/2025.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://127.0.0.1:8080"
}

enum NetworkError: Error {
    case invalidURL, requestFailed, invalidResponse
}


enum ActivityType: String, CaseIterable, Identifiable {

    case running
    case cycling
    case swimming
    case rowing
    case hiking
    
    case strengthTraining
    case crossfit
    case pilates
    
    case soccer
    case basketball
    case tennis
    
    case yoga
    case stretching
    case meditation
    
    case dancing
    case boxing
    case climbing
    
    var id: String { backendValue }
    
    var backendValue: String {
        switch self {
        case .running: return "Course"
        case .cycling: return "Vélo"
        case .swimming: return "Natation"
        case .rowing: return "Aviron"
        case .hiking: return "Randonnée"
        case .strengthTraining: return "Musculation"
        case .crossfit: return "CrossFit"
        case .pilates: return "Pilates"
        case .soccer: return "Football"
        case .basketball: return "Basket"
        case .tennis: return "Tennis"
        case .yoga: return "Yoga"
        case .stretching: return "Étirements"
        case .meditation: return "Méditation"
        case .dancing: return "Danse"
        case .boxing: return "Boxe"
        case .climbing: return "Escalade"
        }
    }
    
    var displayName: String {
        switch self {
        case .running: return "🏃‍♂️ Course"
        case .cycling: return "🚴‍♂️ Vélo"
        case .swimming: return "🏊‍♂️ Natation"
        case .rowing: return "🚣‍♂️ Aviron"
        case .hiking: return "⛰️ Randonnée"
        case .strengthTraining: return "💪 Musculation"
        case .crossfit: return "🏋️‍♂️ CrossFit"
        case .pilates: return "🧘‍♀️ Pilates"
        case .soccer: return "⚽ Football"
        case .basketball: return "🏀 Basket"
        case .tennis: return "🎾 Tennis"
        case .yoga: return "🧘‍♂️ Yoga"
        case .stretching: return "🤸‍♂️ Étirements"
        case .meditation: return "🧭 Méditation"
        case .dancing: return "💃 Danse"
        case .boxing: return "🥊 Boxe"
        case .climbing: return "🧗‍♂️ Escalade"
        }
    }
}

enum MealType: String, CaseIterable {
    case breakfast = "Petit-déj"
    case lunch = "Déjeuner"
    case snack = "Collation"
    case dinner = "Dîner"
}

func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    formatter.locale = Locale(identifier: "fr_FR")
    return formatter.string(from: date)
}
