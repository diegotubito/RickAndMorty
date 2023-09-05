//
//  ImageEntity.swift
//  RickAndMorty
//
//  Created by David Diego Gomez on 04/09/2023.
//

import Foundation

struct ImageEntity {
    struct Request: Encodable {
        let id: Int
    }
    
    typealias Response = Data
}
