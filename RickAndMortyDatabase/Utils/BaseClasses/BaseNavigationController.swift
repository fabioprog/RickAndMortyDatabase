//
//  BaseNavigationController.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 14/08/23.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        navigationBar.barTintColor = RMColorAsset.primary.color
        navigationBar.backgroundColor = RMColorAsset.primary.color
        navigationBar.titleTextAttributes = [.foregroundColor: RMColorAsset.primaryText.color]
        navigationBar.largeTitleTextAttributes = [.foregroundColor: RMColorAsset.primaryText.color]
        navigationBar.tintColor = RMColorAsset.primaryText.color
        navigationBar.prefersLargeTitles = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return traitCollection.userInterfaceStyle == .light ? .darkContent : .lightContent
    }
}
