//
//  ProfileView.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Hello wrold")
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Mon Profil")
                    .font(.custom("Lexend-Medium", size: 24))
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
