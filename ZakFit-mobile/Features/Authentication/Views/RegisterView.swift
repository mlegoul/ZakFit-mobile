//
//  RegisterView.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 03/12/2025.
//

import SwiftUI

struct RegisterView: View {
    @State private var viewModel: RegisterViewModel
    @Environment(AppState.self) private var appState
    
    init(appState: AppState) {
        _viewModel = State(wrappedValue: RegisterViewModel(appState: appState))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 150)
                
                VStack(spacing: 8) {
                    Text("C'est parti !")
                        .font(.custom("Lexend-Medium", size: 27))
                }
                .foregroundColor(.primary)
                
                
                VStack(spacing: 16) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("light-grey"))
                            .frame(height: 56)
                        
                        TextField("Prénom", text: $viewModel.firstName)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .font(.custom("Lexend-Medium", size: 16))
                            .padding(.horizontal, 16)
                    }
                    .frame(width: 360, height: 56)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("light-grey"))
                            .frame(height: 56)
                        
                        TextField("Nom", text: $viewModel.lastName)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .font(.custom("Lexend-Medium", size: 16))
                            .padding(.horizontal, 16)
                    }
                    .frame(width: 360, height: 56)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("light-grey"))
                            .frame(height: 56)
                        
                        TextField("Email", text: $viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .font(.custom("Lexend-Medium", size: 16))
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .padding(.horizontal, 16)
                    }
                    .frame(width: 360, height: 56)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("light-grey"))
                            .frame(height: 56)
                        
                        SecureField("Mot de passe", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .font(.custom("Lexend-Medium", size: 16))
                            .padding(.horizontal, 16)
                    }
                    .frame(width: 360, height: 56)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("light-grey"))
                            .frame(height: 56)
                        
                        SecureField(
                            "Confirmer votre mot de passe",
                            text: $viewModel.passwordConfirmation
                        )
                        .textFieldStyle(DefaultTextFieldStyle())
                        .font(.custom("Lexend-Medium", size: 16))
                        .padding(.horizontal, 16)
                    }
                    .frame(width: 360, height: 56)
                    
                    Button(action: {
                        Task {
                            await viewModel.register()
                        }
                    }) {
                        Text("S'inscrire")
                            .font(.custom("Lexend-Medium", size: 18))
                            .foregroundColor(.white)
                            .frame(width: 360, height: 56)
                            .background(Color.black)
                            .cornerRadius(25)
                    }
                    .disabled(viewModel.isLoading)
                    .padding(.top, 20)
                }
                
                Spacer()
                
                VStack(spacing: 8) {
                    Text("Avez-vous un compte ?")
                        .font(.custom("Lexend-Bold", size: 17))
                        .foregroundColor(.primary)
                    
                    NavigationLink(destination: LoginView(appState: appState)) {
                        Text("Se connecter")
                            .font(.custom("Lexend-Bold", size: 17))
                            .foregroundColor(Color("light-orange"))
                    }
                }
            }
            .navigationBarHidden(true)
            .padding()
        }
    }
}

#Preview {
    RegisterView(appState: AppState())
        .environment(AppState())
}
