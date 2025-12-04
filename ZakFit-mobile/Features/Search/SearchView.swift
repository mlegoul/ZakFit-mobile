//
//  SearchView.swift
//  ZakFit-mobile
//
//  Created by Mehdi Legoullon on 03/12/2025.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        
        NavigationStack {
            
            Text("Recherche")
                .font(.custom("Lexend-Medium", size: 24))
                .padding()
            
            VStack(alignment: .leading, spacing: 20) {
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Catégories")
                        .font(.custom("Lexend-Medium", size: 20))
                        .padding()
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("light-grey"))
                        .frame(width: 360, height: 250)
                        .overlay(
                            VStack(alignment: .leading, spacing: 0) {
                                NavigationLink(destination: MyActivitiesView()) {
                                    
                                    HStack(spacing: 0) {
                                        Image(systemName: "flame.fill")
                                            .foregroundColor(Color("light-red"))
                                            .padding(8)
                                        
                                        Text("Activités")
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
                                }
                                
                                Divider()
                                    .padding(.leading, 44)
                                
                                NavigationLink(destination: MyMealsView()) {
                                    
                                    HStack(spacing: 0) {
                                        Image(systemName: "fork.knife")
                                            .foregroundColor(Color("light-green"))
                                            .padding(8)
                                        
                                        Text("Repas")
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
                                }
                                
                                Divider()
                                    .padding(.leading, 44)
                                
                                HStack(spacing: 0) {
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color("light-purple"))
                                        .padding(8)
                                    
                                    Text("Historique")
                                        .font(.custom("Lexend-Medium", size: 16))
                                        .padding(.leading, 8)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black)
                                        .padding(.trailing, 16)
                                }
                                .padding(.vertical, 12)
                                .padding(.leading, 16)
                                
                                Divider()
                                    .padding(.leading, 44)
                                
                                HStack(spacing: 0) {
                                    Image(systemName: "doc.fill")
                                        .foregroundColor(Color("light-blue"))
                                        .padding(8)
                                    
                                    Text("Rapports")
                                        .font(.custom("Lexend-Medium", size: 16))
                                        .padding(.leading, 8)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black)
                                        .padding(.trailing, 16)
                                }
                                .padding(.vertical, 12)
                                .padding(.leading, 16)
                            }
                        )
                        .padding(.horizontal)
                }
                Spacer()
            }
            .padding(.top, 40)
        }
    }
}

#Preview {
    SearchView()
}
