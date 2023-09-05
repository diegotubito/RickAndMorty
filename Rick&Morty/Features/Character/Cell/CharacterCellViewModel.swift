//
//  CharacterCellViewModel.swift
//  Rick&Morty
//
//  Created by David Diego Gomez on 05/09/2023.
//

import SwiftUI

class CharacterCellViewModel: ObservableObject {
    @Published var character: CharacterModel
    @Published var image: UIImage = UIImage()
    @Published var isFavorite = false
    
    init(character: CharacterModel) {
        self.character = character
        readFavorite()
    }
    
    func toggleFavorite() {
        let currentValue = UserDefaults.standard.object(forKey: "favorite_\(character.name)") as? Bool
        let newValue = currentValue == true ? false : true
        UserDefaults.standard.set(newValue, forKey: "favorite_\(character.name)")
        isFavorite = newValue
    }
    
    func readFavorite() {
        let currectValue = UserDefaults.standard.object(forKey: "favorite_\(character.name)") as? Bool
        isFavorite = currectValue ?? false
    }
    
}
