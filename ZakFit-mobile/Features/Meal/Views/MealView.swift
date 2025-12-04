//
//  MealView.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 03/12/2025.
//

import SwiftUI

struct MealView: View {
    @State private var viewModel: MealViewModel
    
    init() {
        _viewModel = State(wrappedValue: MealViewModel(appState: AppState()))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Ajouter un Repas")
                .font(.custom("Lexend-Medium", size: 24))
                .padding()
            
            VStack(alignment: .leading) {
                Text("Type de Repas")
                    .font(.custom("Lexend-Medium", size: 20))
                    .padding(.top, 30)
                
                HStack(spacing: 12) {
                    ForEach(MealType.allCases, id: \.self) { mealType in
                        Button {
                            withAnimation(
                                .spring(response: 0.3, dampingFraction: 0.6)
                            ) {
                                viewModel.type = mealType
                            }
                        } label: {
                            Text(mealType.rawValue)
                                .font(.custom("Lexend-Medium", size: 14))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 9)
                                .padding(.horizontal, 9)
                                .background(
                                    viewModel.type == mealType ? Color.blue : Color.gray
                                        .opacity(0.2)
                                )
                                .foregroundColor(
                                    viewModel.type == mealType ? .white : .primary
                                )
                                .cornerRadius(20)
                        }
                    }
                }
                .padding(.top, 8)

                
                
                Text("Rechercher un aliment")
                    .font(.custom("Lexend-Medium", size: 20))
                    .padding(.top, 30)
                
                TextField("Nom de l'aliment", text: $viewModel.foodName)
                    .textFieldStyle(.roundedBorder)
                
                Text("Quantité (en g)")
                    .font(.custom("Lexend-Medium", size: 20))
                    .padding(.top, 30)
                
                Stepper(
                    "Quantité : \(viewModel.quantity) g",
                    value: $viewModel.quantity,
                    in: 1...500
                )
            }
            .padding()
            
            Spacer()
            
            Button {
                Task {
                    await viewModel.submitMeal()
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
    MealView()
}
