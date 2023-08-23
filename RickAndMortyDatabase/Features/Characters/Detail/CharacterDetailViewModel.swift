//
//  CharacterDetailViewModel.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 10/08/23.
//

import UIKit

protocol CharacterDetailViewModelDelegate {
    var character: Character { get }
}

class CharacterDetailViewModel: CharacterDetailViewModelDelegate {

    var character: Character
    
    required init(character: Character) {
        self.character = character
    }
}
