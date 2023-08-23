//
//  CharacterStatus.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 13/08/23.
//

import Foundation

enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"

    var text: String {
        switch self {
        default: return rawValue
        }
    }
    
    var localizedText: String {
        switch self {
        default: return NSLocalizedString("characterStatus" + rawValue.capitalized, comment: "")
        }
    }
}
