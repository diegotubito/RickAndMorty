//
//  ImageUseCase.swift
//  RickAndMorty
//
//  Created by David Diego Gomez on 04/09/2023.
//

import Foundation

protocol ImageUseCaseProtocol {
    init(repository: ImageRepositoryProtocol)
    func getImage(id: Int) async throws -> ImageResult
}

class ImageUseCase: ImageUseCaseProtocol {
    var repository: ImageRepositoryProtocol
    
    required init(repository: ImageRepositoryProtocol = ImageRepository() ) {
        self.repository = repository
    }
    
    func getImage(id: Int) async throws -> ImageResult {
        let request = ImageEntity.Request(id: id)
        return try await repository.getImage(request: request)
    }
}


