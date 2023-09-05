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
            Text(viewModel.locationReceived.name)
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(viewModel: LocationViewModel(location: CharacterModel.Location(name: "Name", url: "https://rickandmortyapi.com/api/location/3")))
    }
}
