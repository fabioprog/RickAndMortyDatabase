//
//  CharacterDetailViewController.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 10/08/23.
//

import UIKit

class CharacterDetailViewController: BaseViewController<CharacterDetailView> {

    var viewModel: CharacterDetailViewModelDelegate
        
    required init(viewModel: CharacterDetailViewModelDelegate) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.character.name
        setupCharacter()
    }
    
    func setupCharacter() {
        customView.imageView.loadFrom(urlString: viewModel.character.image)
        customView.speciesLabel.text = viewModel.character.species
        customView.genderLabel.text = viewModel.character.gender.localizedText
        customView.statusLabel.text = viewModel.character.status.localizedText
        customView.originLabel.text = viewModel.character.origin.name
    }

}
