//
//  CharacterClient.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 13/08/23.
//

import Foundation

protocol CharacterProtocol {
    func getCharacters(page: String?, name: String?, status: String?) async throws -> CharactersResponse
}

class CharacterClient: CharacterProtocol {
    func getCharacters(page: String?, name: String?, status: String?) async throws -> CharactersResponse {
        let router = CharacterRoute.getCharacters(page: page, name: name, status: status).router
        let response: CharactersResponse = try await APIRequest.request(apiRouter: router)
        return response
    }
}
