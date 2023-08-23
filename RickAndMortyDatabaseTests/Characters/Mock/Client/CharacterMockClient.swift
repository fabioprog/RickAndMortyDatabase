//
//  CharacterMockClient.swift
//  RickAndMortyDatabaseTests
//
//  Created by Fabio Augusto Resende on 16/08/23.
//

import Foundation
@testable import RickAndMortyDatabase

enum CharacterMockRoute {
    
    case getCharacters
    case getCharactersWithEmptyNextURL
    
    var path: String {
        switch self {
        case .getCharacters:
            return "get_characters"
        case .getCharactersWithEmptyNextURL:
            return "get_characters_next_url_empty"
        }
    }
}

class CharacterMockClient: CharacterClient {
    override func getCharacters(page: String?, name: String?, status: String?) async throws -> CharactersResponse {
        let path = CharacterMockRoute.getCharacters.path
        let response: CharactersResponse = try await MockRequest.getFile(by: path)
        return response
    }
}

class CharacterMockWithEmptyNextURLClient: CharacterClient {
    override func getCharacters(page: String?, name: String?, status: String?) async throws -> CharactersResponse {
        let path = CharacterMockRoute.getCharactersWithEmptyNextURL.path
        let response: CharactersResponse = try await MockRequest.getFile(by: path)
        return response
    }
}
