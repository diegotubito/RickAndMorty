//
//  ImageRepository.swift
//  RickAndMorty
//
//  Created by David Diego Gomez on 04/09/2023.
//

import Foundation

typealias ImageResult = ImageEntity.Response

protocol ImageRepositoryProtocol {
    func getImage(request: ImageEntity.Request) async throws -> ImageResult
}

class ImageRepository: ApiNetworkAsync, ImageRepositoryProtocol {
    func getImage(request: ImageEntity.Request) async throws -> ImageResult {
        config.path = "/api/character/avatar/\(request.id).jpeg"
        config.method = .get
        return try await apiCall()
    }
}
