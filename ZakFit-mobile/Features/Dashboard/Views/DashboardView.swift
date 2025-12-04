//
//  DashboardView.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 03/12/2025.
//

import SwiftUI

struct DashboardView: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        VStack {
            
            Text("Salut \(appState.user?.firstName ?? "User")")
                .font(.custom("Lexend-Medium", size: 27))
                .padding()
        
            
            Spacer()
            
            Button(action: {
                appState.token = nil
                appState.isLoggedIn = false
            }) {
                Text("Se déconnecter")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    DashboardView()
        .environment(AppState())
}
