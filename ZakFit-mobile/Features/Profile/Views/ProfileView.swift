//
//  ProfileView.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 04/12/2025.
//


import SwiftUI

struct ProfileView: View {
    @State private var showConfirmation = false
    @State private var viewModel: ProfileViewModel
    
    init(appState: AppState) {
        _viewModel = State(initialValue: ProfileViewModel(appState: appState))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Catégories")
                .font(.custom("Lexend-Medium", size: 20))
                .padding()
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("light-grey"))
                .frame(width: 360, height: 150)
                .overlay(
                    VStack(alignment: .leading, spacing: 0) {
                        
                        NavigationLink(destination: ProfileDataView()) {
                            HStack(spacing: 0) {
                                Text("Informations Personnelles")
                                    .font(.custom("Lexend-Medium", size: 16))
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 16)
                            }
                            .padding(.vertical, 12)
                            .padding(.leading, 16)
                            .contentShape(Rectangle())
                        }
                        
                        Divider()
                            .padding(.leading, 44)
                        
                        NavigationLink(destination: ProfileHealthView()) {
                            HStack(spacing: 0) {
                                Text("Informations de Santé")
                                    .font(.custom("Lexend-Medium", size: 16))
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 16)
                            }
                            .padding(.vertical, 12)
                            .padding(.leading, 16)
                            .contentShape(Rectangle())
                        }
                        
                        Divider()
                            .padding(.leading, 44)
                        
                        NavigationLink(destination: GoalView()) {
                            HStack(spacing: 0) {
                                Text("Objectifs")
                                    .font(.custom("Lexend-Medium", size: 16))
                                    .padding(.leading, 8)
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 16)
                            }
                            .padding(.vertical, 12)
                            .padding(.leading, 16)
                            .contentShape(Rectangle())
                        }
                        
                    }
                )
                .padding(.horizontal)
            
            HStack {
                Button(action: {
                    showConfirmation.toggle()
                }) {
                    Text("Supprimer mon compte ?")
                        .font(.custom("Lexend-Medium", size: 16))
                        .foregroundColor(.red)
                        .underline()
                }
                .padding(.leading, 20)
            }
            .padding(.top, 80)
            
            Spacer()

            
            Button(action: {
                Task {
                    await viewModel.logout()
                }
            }) {
                Text("Se déconnecter")
                    .font(.custom("Lexend-Medium", size: 18))
                    .foregroundColor(.white)
                    .frame(width: 360, height: 56)
                    .background(Color.black)
                    .cornerRadius(25)
            }
            .padding()
        }
        
        .alert("Confirmer la suppression", isPresented: $showConfirmation) {
            Button("Annuler", role: .cancel) {}
            Button("Supprimer", role: .destructive) {
                Task {
                    await viewModel.deleteUser()
                }
            }
        } message: {
            Text(
                "Êtes-vous sûr de vouloir supprimer votre compte ? Cette action est irréversible."
            )
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
        ProfileView(appState: AppState())
    }
}
