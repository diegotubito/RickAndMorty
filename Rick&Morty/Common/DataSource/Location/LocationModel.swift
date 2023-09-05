//
//  LocationModel.swift
//  RickAndMorty
//
//  Created by David Diego Gomez on 04/09/2023.
//

import Foundation

struct LocationModel: Decodable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
}
