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
    
    init(character: CharacterModel) {
        self.character = character
    }
    
   
    
}
