//
//  LocationView.swift
//  Rick&Morty
//
//  Created by David Diego Gomez on 05/09/2023.
//

import SwiftUI

struct LocationView: View {
    
    @StateObject var viewModel: LocationViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .black, .blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 0) {
                    VStack {
                        HStack {
                            Text(viewModel.character.name + " last location")
                                .font(.title3)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                    }
                    
                    VStack(spacing: 20) {
                        Text(viewModel.location?.name ?? "")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white.opacity(0.8))
                        
                        HStack {
                            Image(systemName: "info.circle")
                            Text("Type: \(viewModel.location?.type ?? "")")
                            Spacer()
                        }
                        .font(.headline)
                        .foregroundColor(.gray)
                        
                        HStack {
                            Image(systemName: "person")
                            Text("Residents: \(String(viewModel.location?.residents.count ?? 0))")
                            Spacer()
                        }
                        .font(.headline)
                        .foregroundColor(.gray)
                        
                        HStack {
                            Image(systemName: "globe")
                            Text("Dimension: \(viewModel.location?.dimension ?? "")")
                            Spacer()
                        }
                        .font(.headline)
                        .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.cyan.opacity(0.2))
                    .cornerRadius(10)
                }
                .padding([.horizontal, .top], 32)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Location")
        .background(Color(.systemBackground))
        .onAppear {
            viewModel.loadLocation()
        }
    }
}

