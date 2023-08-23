//
//  RMColorAsset.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 14/08/23.
//

import UIKit

enum RMColorAsset: String {
    case primary = "PrimaryColor"
    case primaryText = "PrimaryTextColor"
    
    var color: UIColor {
        switch self {
        default: return UIColor(named: self.rawValue) ?? .clear
        }
    }
}
