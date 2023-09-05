//
//  LocationEntity.swift
//  RickAndMorty
//
//  Created by David Diego Gomez on 04/09/2023.
//

import Foundation

struct LocationEntity {
    struct Request: Encodable {
        let url: String
    }
    
    typealias Response = LocationModel
}
