//
//  TabBarView.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 03/12/2025.
//

import SwiftUI

struct TabBarView: View {
    @Environment(AppState.self) private var appState
    @State var text = ""
    
    var body: some View {
        TabView {

            Tab {
                NavigationStack { DashboardView() }
            } label: {
                Label("Accueil",systemImage: "house.fill")
            }
            
            Tab {
                NavigationStack { MealView() }
            } label: {
                Label("Repas", systemImage: "fork.knife")
            }
            
            Tab {
                NavigationStack { ActivityView() }
            } label: {
                Label("Activités", systemImage: "figure.run")
            }
            
            Tab(role: .search) {
                NavigationStack {
                    SearchView()
                        .searchable(text: $text, prompt: "Rechercher")
                        .disabled(true)
                }
            }
        }
        .tint(Color("light-orange"))
        .background(.ultraThinMaterial)
    }
}

#Preview {
    TabBarView()
        .environment(AppState())
}
