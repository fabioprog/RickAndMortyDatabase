//
//  RMImageAsset.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 14/08/23.
//

import UIKit

enum RMImageAsset: String {
    case launchImg = "launch-img"
    case filter = "filter-icon"
    case close = "close-icon"
    
    var image: UIImage {
        switch self {
        default: return UIImage(named: self.rawValue) ?? UIImage()
        }
    }
}
