//
//  URLComponentsExtension.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 13/08/23.
//

import Foundation
import UIKit

extension String {
    
    func getURLComponentBy(key: String) -> String? {
        guard let url = URL(string: self),
              let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let item = components.queryItems?.first(where: { $0.name == key })?.value
        else {
            return nil
        }
        return item
    }    
}
