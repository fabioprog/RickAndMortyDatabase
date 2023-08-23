//
//  BaseStrings.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 15/08/23.
//

import Foundation

enum BaseStrings: String {
    case errorTitle = "errorTitle"
    case ok = "OK"
    case cancel = "cancel"
    
    var text: String {
        switch self {
        default: return NSLocalizedString(rawValue, comment: "")
        }
    }
}
