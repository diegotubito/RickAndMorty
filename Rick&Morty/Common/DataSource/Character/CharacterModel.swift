//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by David Diego Gomez on 04/09/2023.
//

import Foundation

struct CharacterModel: Decodable {
    let id: Int
    let name: String
    let species: String
    let gender: String
    let image: String
    let location: Location
    
    var imageState: ImageState? = .new
    var imageData: Data?
    var isFavourite: Bool?
    
    enum ImageState: Decodable {
        case new, downloaded, failed
    }
    
    struct Location: Decodable {
        let name: String
        let url: String
    }
}
