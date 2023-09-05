//
//  CharacterCell.swift
//  Rick&Morty
//
//  Created by David Diego Gomez on 05/09/2023.
//

import SwiftUI

struct CharacterCell: View {
    @Binding var path: [CharacterModel]
    @State var viewModel: CharacterCellViewModel
    @State var imageName = ""
    
    var body: some View {
        VStack {
            ProfileImageView(id: viewModel.character._id)
            
            HStack {
                Text(viewModel.character.name)
                Spacer()
                Image(imageName)
                    .onTapGesture {
                        viewModel.toggleFavorite()
                    }
            }
            
            HStack {
                Text("Location: " + viewModel.character.location.name)
                    .foregroundColor(.accentColor)
                    .font(.caption)
                    .onTapGesture {
                        path.append(viewModel.character)
                    }
                Spacer()
            }
        }
        .onReceive(viewModel.$isFavorite) { isFavorite in
            if isFavorite {
                imageName = "filled-heart"
            } else {
                imageName = "empty-heart"
            }
        }
    }
}

