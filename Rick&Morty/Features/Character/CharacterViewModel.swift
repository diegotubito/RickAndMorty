//
//  CharacterViewModel.swift
//  Rick&Morty
//
//  Created by David Diego Gomez on 05/09/2023.
//

import SwiftUI

class CharacterViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var showAlert: String = ""
    @Published var characters: [CharacterModel] = []

    private var page = 0
    private var info: CharacterEntity.Info?

    @MainActor
    func loadCharacters() {
        guard !isLoading else { return }
        isLoading = true
        Task {
            do {
                let characterUseCase = CharacterUseCase()
                let response = try await characterUseCase.getCharacters(page: page)
                DispatchQueue.main.async {
                    if response.info.next != nil {
                        self.page += 1
                    }
                    self.info = response.info
                    self.isLoading = false
                    self.characters.append(contentsOf: response.results)
                }
            } catch  {
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.showAlert = error.localizedDescription
                }
            }
        }
    }
}
