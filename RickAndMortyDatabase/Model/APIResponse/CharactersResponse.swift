//
//  CharactersResponse.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 13/08/23.
//

import Foundation

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct CharactersResponse: Codable {
    let info: Info
    let results: [Character]
}
