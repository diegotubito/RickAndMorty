//
//  CharacterEntity.swift
//  RickAndMorty
//
//  Created by David Diego Gomez on 04/09/2023.
//

import Foundation

struct CharacterEntity {
    struct Request {
        let page: Int
    }
    
    struct Response: Decodable {
        let info: Info
        let results: [CharacterModel]
    }
    
    struct Info: Decodable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
}
