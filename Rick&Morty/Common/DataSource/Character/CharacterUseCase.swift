//
//  CharacterUseCase.swift
//  RickAndMorty
//
//  Created by David Diego Gomez on 04/09/2023.
//

import Foundation

protocol CharacterUseCaseProtocol {
    init(repository: CharacterRepositoryProtocol)
    func getCharacters(page: Int) async throws -> CharacterResult
}

class CharacterUseCase: CharacterUseCaseProtocol {
    var repository: CharacterRepositoryProtocol
    
    required init(repository: CharacterRepositoryProtocol = CharacterFactory.create() ) {
        self.repository = repository
    }
    
    func getCharacters(page: Int) async throws -> CharacterResult {
        let request = CharacterEntity.Request(page: page)
        return try await repository.getCharacters(request: request)
    }
}
