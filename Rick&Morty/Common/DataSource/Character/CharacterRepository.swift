//
//  CharacterRepository.swift
//  RickAndMorty
//
//  Created by David Diego Gomez on 04/09/2023.
//

import Foundation

typealias CharacterResult = CharacterEntity.Response

protocol CharacterRepositoryProtocol {
    func getCharacters(request: CharacterEntity.Request) async throws -> CharacterResult
}

class CharacterRepository: ApiNetworkAsync, CharacterRepositoryProtocol {
    func getCharacters(request: CharacterEntity.Request) async throws -> CharacterResult {
        config.path = "/api/character"
        config.method = .get
        if request.page != 0 {
            config.addQueryItem(key: "page", value: String(request.page + 1))
        }
        return try await apiCall()
    }
}

class CharacterRepositoryMock: ApiNetworkMockAsync, CharacterRepositoryProtocol {
    func getCharacters(request: CharacterEntity.Request) async throws -> CharacterResult {
        mockFileName = "character_mock_response"
        return try await apiCallMocked(bundle: .main)
    }
}

class CharacterFactory {
    static func create() -> CharacterRepositoryProtocol {
        let testing = ProcessInfo.processInfo.arguments.contains("-uiTest")
        
        return testing ? CharacterRepositoryMock() : CharacterRepository()
    }
}
