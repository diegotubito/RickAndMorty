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
        VStack {
            Text(viewModel.location?.name ?? "")
            Text("type: " + (viewModel.location?.type ?? ""))
            Text("Number of residents: " + String(viewModel.location?.residents.count ?? 0))
            Text("Dimension: " + (viewModel.location?.dimension ?? ""))
        }
        .onAppear {
            viewModel.loadLocation()
        }
    }
}
