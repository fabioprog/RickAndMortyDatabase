//
//  CharacterFilterViewModel.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 11/08/23.
//

import UIKit

protocol CharacterFilterDelegate {
    func filterDidSet(name: String?, status: String?)
}

protocol CharacterFilterViewModelDelegate {
    var name: String? { get set }
    var status: String? { get set }
    var navigator: CharactersNavigator { get set }
    func filterDidSet()
}

class CharacterFilterViewModel {
    
    var name: String?
    var status: String?
    var delegate: CharacterFilterDelegate
    var navigator: CharactersNavigator
    
    required init(delegate: CharacterFilterDelegate, navigator: CharactersNavigator) {
        self.delegate = delegate
        self.navigator = navigator
    }
}

extension CharacterFilterViewModel: CharacterFilterViewModelDelegate {
    func filterDidSet() {
        navigator.dismiss(animated: true) {
            self.delegate.filterDidSet(name: self.name,
                                       status: self.status)
        }
    }
}
