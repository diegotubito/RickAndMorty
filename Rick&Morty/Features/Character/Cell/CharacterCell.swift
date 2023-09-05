//
//  CharacterCell.swift
//  Rick&Morty
//
//  Created by David Diego Gomez on 05/09/2023.
//

import SwiftUI

struct CharacterCell: View {
    @Binding var path: [CharacterModel.Location]
    @State var viewModel: CharacterCellViewModel
    
    var body: some View {
        VStack {
            ProfileImageView(id: viewModel.character._id)
              
            HStack {
                Text(viewModel.character.name)
                Spacer()
            }
            
            HStack {
                Text("Location: " + viewModel.character.location.name)
                    .foregroundColor(.accentColor)
                    .font(.caption)
                    .onTapGesture {
                        path.append(viewModel.character.location)
                    }
                Spacer()
            }
        }
    }
}

