//
//  APIRouter.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 13/08/23.
//

import UIKit

struct APIRouter {
    
    var host: String = "rickandmortyapi.com"
    var scheme: String = "https"
    var path: String = ""
    var method: String = "GET"
    var parameters: [URLQueryItem]?
    
    init(path: String, method: String, parameters: [URLQueryItem]) {
        self.path = path
        self.method = method
        self.parameters = parameters
    }    
}
