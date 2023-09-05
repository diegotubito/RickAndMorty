//
//  ImageView.swift
//  Rick&Morty
//
//  Created by David Diego Gomez on 05/09/2023.
//

import SwiftUI
import Combine

struct ProfileImageView: View {
    private let id: Int
    @StateObject var imageManager = ImageLoader()
    
    init(id: Int) {
        self.id = id
    }
    
    var body: some View {
        Group {
            Image(uiImage: imageManager.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
        }
        .onAppear {
            imageManager.loadImage(id: id)
        }
        .overlay {
            if imageManager.isLoading {
                ProgressView()
            }
        }
    }
}

