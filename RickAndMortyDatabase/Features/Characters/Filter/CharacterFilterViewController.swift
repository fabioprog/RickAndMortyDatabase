//
//  CharacterFilterViewController.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 11/08/23.
//

import UIKit

class CharacterFilterViewController: BaseViewController<CharacterFilterView> {
    
    var viewModel: CharacterFilterViewModelDelegate
    
    required init(viewModel: CharacterFilterViewModelDelegate) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    func setupButtons() {
        customView.closeButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        customView.statusButton.addTarget(self, action: #selector(statusAction), for: .touchUpInside)
        customView.clearButton.addTarget(self, action: #selector(clearAction), for: .touchUpInside)
        customView.applyButton.addTarget(self, action: #selector(filterAction), for: .touchUpInside)
    }
    
    @objc func clearAction() {
        viewModel.name = nil
        viewModel.status = nil
        customView.nameTextField.text = ""
        customView.statusButton.setTitle(CharacterStrings.filterStatusPlaceholder.text, for: .normal)
    }
    
    @objc func filterAction() {
        viewModel.name = customView.nameTextField.text
        viewModel.filterDidSet()
    }
    
    @objc func closeAction() {
        viewModel.navigator.dismiss(animated: true)
    }
    
    @objc func statusAction() {
        presentAlert(title: CharacterStrings.filterStatusPlaceholder.text,
                     style: .actionSheet,
                     options: [
                        (title: CharacterStatus.alive.localizedText,
                         style: .default,
                         uiIdentifier: CharacterUIIdentifier.filterStatusActionAlive.text),
                        (title: CharacterStatus.dead.localizedText,
                         style: .default,
                         uiIdentifier: CharacterUIIdentifier.filterStatusActionDead.text),
                        (title: CharacterStatus.unknown.localizedText,
                         style: .default,
                         uiIdentifier: CharacterUIIdentifier.filterStatusActionUnknown.text),
                        (title: BaseStrings.cancel.text,
                         style: .cancel,
                         uiIdentifier: "")])
        { [weak self] option  in
            switch option {
            case CharacterStatus.alive.localizedText:
                self?.customView.statusButton.setTitle(option, for: .normal)
                self?.viewModel.status = CharacterStatus.alive.text
            case CharacterStatus.dead.localizedText:
                self?.customView.statusButton.setTitle(option, for: .normal)
                self?.viewModel.status = CharacterStatus.dead.text
            case CharacterStatus.unknown.localizedText:
                self?.customView.statusButton.setTitle(option, for: .normal)
                self?.viewModel.status = CharacterStatus.unknown.text
            default: break
            }
        }
    }
}
