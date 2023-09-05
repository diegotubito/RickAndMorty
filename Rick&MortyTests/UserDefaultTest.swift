//
//  UserDefaultTest.swift
//  Rick&MortyTests
//
//  Created by David Diego Gomez on 05/09/2023.
//

import XCTest
@testable import Rick_Morty

class UserDefaultTest: XCTestCase {
    
    func getMockCharacter() -> CharacterModel {
        return CharacterModel(_id: 1,
                              name: "Rick",
                              species: "Human",
                              gender: "Male",
                              image: "",
                              location: CharacterModel.Location(name: "", url: ""))
        
    }

    func testToggleFavorite() {
        let character = getMockCharacter()
        let viewModel = CharacterCellViewModel(character: character) // Replace `YourViewModel` with the name of your ViewModel class.
        
        // Case 1: Initially not favorited
        XCTAssertFalse(viewModel.isFavorite)
        
        // Case 2: After toggling, should become true.
        viewModel.toggleFavorite()
        XCTAssertTrue(viewModel.isFavorite)
        
        // Case 3: Toggle again to set it to false.
        viewModel.toggleFavorite()
        XCTAssertFalse(viewModel.isFavorite)
    }

    func testReadFavorite() {
        let character = getMockCharacter()
        let viewModel = CharacterCellViewModel(character: character)
        
        // Set up initial UserDefaults value
        UserDefaults.standard.set(true, forKey: "favorite_\(character.name)")
        
        // Read the value; should update isFavorite to true.
        viewModel.readFavorite()
        XCTAssertTrue(viewModel.isFavorite)
        
        // Change UserDefaults value to false
        UserDefaults.standard.set(false, forKey: "favorite_\(character.name)")
        
        // Read again; should update isFavorite to false.
        viewModel.readFavorite()
        XCTAssertFalse(viewModel.isFavorite)
    }

    override func tearDown() {
        // Clear UserDefaults after each test.
        UserDefaults.standard.removeObject(forKey: "favorite_Rick")
    }


}
