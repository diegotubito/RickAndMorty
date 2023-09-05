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
        ScrollView {
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text(viewModel.location?.name ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack {
                        Image(systemName: "info.circle")
                        Text("Type: \(viewModel.location?.type ?? "")")
                    }
                    .font(.headline)
                    .foregroundColor(.gray)
                    
                    HStack {
                        Image(systemName: "person")
                        Text("Residents: \(String(viewModel.location?.residents.count ?? 0))")
                    }
                    .font(.headline)
                    .foregroundColor(.gray)
                    
                    HStack {
                        Image(systemName: "globe")
                        Text("Dimension: \(viewModel.location?.dimension ?? "")")
                    }
                    .font(.headline)
                    .foregroundColor(.gray)
                    
                    Spacer()
                }
                Spacer()
            }
            .padding(.horizontal)
            
        }
        .navigationTitle("Location")
        .background(Color(.systemBackground))
        .onAppear {
            viewModel.loadLocation()
        }
    }
}

