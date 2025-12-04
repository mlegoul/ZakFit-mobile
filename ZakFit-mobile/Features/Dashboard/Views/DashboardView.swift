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
        NavigationStack {
            VStack {
                HStack {
                    Text("Salut \(appState.user?.firstName ?? "User")")
                        .font(.custom("Lexend-Medium", size: 24))
                        .fontWeight(.bold)
                    Spacer()

                    NavigationLink(destination: ProfileView(appState: appState)) {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 19, weight: .bold))
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.black)
                            .cornerRadius(12)
                    }
                    .padding(.trailing, 16)
                }
                .padding(.top, 16)
                .padding(.horizontal)
                
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
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.1))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    DashboardView()
        .environment(AppState())
}
