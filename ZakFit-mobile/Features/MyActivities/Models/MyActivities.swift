//
//  MyActivities.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import Foundation

struct MyActivities: Codable, Identifiable {
    var id = UUID()
    let type: String
    let calories: Int
    let duration: Int
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case type, calories, duration, date
    }
}
