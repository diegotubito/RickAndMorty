//
//  LocationViewModel.swift
//  Rick&Morty
//
//  Created by David Diego Gomez on 05/09/2023.
//

import SwiftUI

class LocationViewModel: ObservableObject {
    var character: CharacterModel
    @Published var location: LocationResult?
    
    init(character: CharacterModel) {
        self.character = character
    }

    @MainActor
    func loadLocation() {
        Task {
            do {
                let usecase = LocationUseCase()
                let response = try await usecase.getLocation(url: character.location.url)
                DispatchQueue.main.async {
                    self.location = response
                }
            } catch {
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
