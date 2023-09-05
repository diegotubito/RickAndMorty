//
//  LocationUseCase.swift
//  RickAndMorty
//
//  Created by David Diego Gomez on 04/09/2023.
//

import Foundation

protocol LocationUseCaseProtocol {
    init(repository: LocationRepositoryProtocol)
    func getLocation(url: String) async throws -> LocationResult
}

class LocationUseCase: LocationUseCaseProtocol {
    var repository: LocationRepositoryProtocol
    
    required init(repository: LocationRepositoryProtocol = LocationFactory.create() ) {
        self.repository = repository
    }
    
    func getLocation(url: String) async throws -> LocationResult {
        let request = LocationEntity.Request(url: url)
        return try await repository.getLocation(request: request)
    }
}

