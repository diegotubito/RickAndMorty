//
//  ImageLoader.swift
//  Rick&Morty
//
//  Created by David Diego Gomez on 05/09/2023.
//

import SwiftUI

class ImageLoader: ObservableObject {
    private var imageCache = NSCache<NSNumber, UIImage>()
    @Published var image: UIImage = UIImage()
    @Published var isLoading = false
    
    @MainActor
    func loadImage(id: Int) {
        if let cachedImage = imageCache.object(forKey: NSNumber(value: id)) {
            self.image = cachedImage
            return
        }
        
        Task {
            do {
                isLoading = true
                let imageUseCase = ImageUseCase()
                let data = try await imageUseCase.getImage(id: id)
                isLoading = false
                if let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: NSNumber(value: id))
                    self.image = image
                }
            } catch {
                isLoading = false
                image = UIImage()
            }
        }
    }
}
