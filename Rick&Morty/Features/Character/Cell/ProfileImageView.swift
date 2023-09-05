//
//  ImageView.swift
//  Rick&Morty
//
//  Created by David Diego Gomez on 05/09/2023.
//

import SwiftUI
import Combine

struct ProfileImageView: View {
    @State private var imageData: Data = Data()
    @State private var image: UIImage?
    private let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
            } else {
                ProgressView("Loading...")
            }
        }
        .onAppear {
            Task {
                do {
                    let imageUseCase = ImageUseCase()
                    let response = try await imageUseCase.getImage(id: id)
                    DispatchQueue.main.async {
                        self.image = UIImage(data: response)
                    }
                } catch  {
                    DispatchQueue.main.async {
                        self.image = UIImage()
                    }
                }
            }
        }
    }
}

