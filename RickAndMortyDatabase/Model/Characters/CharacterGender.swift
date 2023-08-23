//
//  CharacterGender.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 13/08/23.
//

import Foundation

enum CharacterGender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
    
    var localizedText: String {
        switch self {
        default: return NSLocalizedString("characterGender" + rawValue.capitalized, comment: "")
        }
    }
}
