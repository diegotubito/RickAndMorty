//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by David Diego Gomez on 04/09/2023.
//

import Foundation

struct CharacterModel: Decodable, Identifiable, Hashable {
    var id: UUID? = UUID()
    
    let _id: Int
    let name: String
    let species: String
    let gender: String
    let image: String
    let location: Location
    var isFavourite: Bool?
    
    struct Location: Decodable, Identifiable, Hashable {
        var id: UUID? = UUID()
        
        let name: String
        let url: String
    }
    
    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case name, species, gender, image, location
    }
}
