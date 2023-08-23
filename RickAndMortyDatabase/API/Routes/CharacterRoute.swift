//
//  CharacterRoute.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 13/08/23.
//

import UIKit

enum CharacterRoute {
    
    case getCharacters(page: String?, name: String?, status: String?)

    private var path: String {
        switch self {
        case .getCharacters:
            return "/api/character/"
        }
    }

    private var method: String {
        switch self {
        case .getCharacters:
            return "GET"
        }
    }

    private var parameters: [URLQueryItem] {
        switch self {
        case .getCharacters(let page, let name, let status):
            var queryItems: [URLQueryItem] = []
            if let page = page { queryItems.append(URLQueryItem(name: "page", value: page)) }
            if let name = name { queryItems.append(URLQueryItem(name: "name", value: name)) }
            if let status = status { queryItems.append(URLQueryItem(name: "status", value: status)) }
            return queryItems
        }
    }
    
    var router: APIRouter {
        switch self {
        default:
            return APIRouter(path: path, method: method, parameters: parameters)
        }
    }
}
