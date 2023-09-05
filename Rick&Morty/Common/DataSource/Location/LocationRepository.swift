//
//  LocationRepository.swift
//  RickAndMorty
//
//  Created by David Diego Gomez on 04/09/2023.
//

import Foundation

typealias LocationResult = LocationEntity.Response

protocol LocationRepositoryProtocol {
    func getLocation(request: LocationEntity.Request) async throws -> LocationResult
}

class LocationRepository: ApiNetworkAsync, LocationRepositoryProtocol {
    func getLocation(request: LocationEntity.Request) async throws -> LocationResult {
        let originalUrl = request.url
        let path = originalUrl.replacingOccurrences(of: "https://rickandmortyapi.com", with: "")
        config.path = path
        config.method = .get
        return try await apiCall()
    }
}

class LocationRepositoryMock: ApiNetworkMockAsync, LocationRepositoryProtocol {
    func getLocation(request: LocationEntity.Request) async throws -> LocationResult {
        mockFileName = "location_mock_response"
        return try await apiCallMocked(bundle: .main)
    }
}

class LocationFactory {
    static func create() -> LocationRepositoryProtocol {
        let testing = ProcessInfo.processInfo.arguments.contains("-uiTest")
        
        return testing ? LocationRepositoryMock() : LocationRepository()
    }
}

