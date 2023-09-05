//
//  LocationViewModel.swift
//  Rick&Morty
//
//  Created by David Diego Gomez on 05/09/2023.
//

import SwiftUI

class LocationViewModel: ObservableObject {
    var locationReceived: CharacterModel.Location
    
    init(location: CharacterModel.Location) {
        self.locationReceived = location
    }
    
    
}
