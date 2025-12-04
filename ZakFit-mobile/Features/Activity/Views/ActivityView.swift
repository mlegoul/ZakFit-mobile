//
//  ActivityView.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 03/12/2025.
//

import SwiftUI

struct ActivityView: View {
    @State private var viewModel: ActivityViewModel
    
    init() {
        _viewModel = State(wrappedValue: ActivityViewModel(appState: AppState()))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Ajouter une activité")
                .font(.custom("Lexend-Medium", size: 24))
                .padding()
                
            VStack(alignment: .leading) {
                Text("Type d'activité")
                    .font(.custom("Lexend-Medium", size: 20))
                    .padding(.top, 30)
                    
                ActivityTypeScrollView(selectedActivity: $viewModel.type)
                    
                Text("Durée")
                    .font(.custom("Lexend-Medium", size: 20))
                    .padding(.top, 30)
                    
                Stepper("\(viewModel.duration) min",
                        value: $viewModel.duration,
                        in: 1...480)
                    
                Text("Calories brûlées")
                    .font(.custom("Lexend-Medium", size: 20))
                    .padding(.top, 30)
                    
                TextField(
                    "0 kcal",
                    value: $viewModel.calories,
                    format: .number
                )
                .textFieldStyle(.roundedBorder)
            }
            .padding()
                
            Spacer()
                
            Button {
                Task {
                    await viewModel.submitActivity()
                }
            } label: {
                Text("Enregistrer")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.lightOrange)
                    .cornerRadius(25)
            }
            .disabled(viewModel.isLoading)
            .padding()
                
            .alert(
                "Erreur",
                isPresented: .constant(viewModel.errorMessage != nil)
            ) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(viewModel.errorMessage ?? "")
            }
        }
    }
}

#Preview {
    ActivityView()
        .environment(AppState())
}
