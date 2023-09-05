//
//  String+Extension.swift
//  RickAndMorty
//
//  Created by David Diego Gomez on 05/09/2023.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
