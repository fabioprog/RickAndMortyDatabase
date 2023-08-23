//
//  CharactersNavigator.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 14/08/23.
//

import UIKit

class CharactersNavigator {

    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigateToCharacterDetail(character: Character) {
        let viewModel = CharacterDetailViewModel(character: character)
        let viewController = CharacterDetailViewController(viewModel: viewModel)
        navigationController.show(viewController, sender: self)
    }
    
    func navigateToFilter(delegate: CharacterFilterDelegate) {
        let viewModel = CharacterFilterViewModel(delegate: delegate, navigator: self)
        let viewController = CharacterFilterViewController(viewModel: viewModel)
        navigationController.present(viewController, animated: true)
    }
    
    func dismiss(animated: Bool, completion: (() -> Void)? = nil) {
        navigationController.dismiss(animated: animated) { completion?() }
    }
}
