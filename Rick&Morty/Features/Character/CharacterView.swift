//
//  ContentView.swift
//  Rick&Morty
//
//  Created by David Diego Gomez on 05/09/2023.
//

import SwiftUI

struct CharacterView: View {
    @StateObject var viewModel = CharacterViewModel()
    @State private var path = [CharacterModel.Location]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List(viewModel.characters, id: \.self) { character in
                    CharacterCell(path: $path, viewModel: CharacterCellViewModel(character: character))
                        .onAppear {
                            if self.viewModel.characters.last == character {
                                self.viewModel.loadCharacters()
                            }
                        }
        
                }
            }
            .navigationDestination(for: CharacterModel.Location.self) { location in
                LocationView(viewModel: LocationViewModel(location: location))
            }
            .navigationTitle("Rick & Morty")
        }
        .onAppear {
            viewModel.loadCharacters()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
