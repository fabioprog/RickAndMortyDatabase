//
//  CharacterFilterView.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 11/08/23.
//

import UIKit

class CharacterFilterView: BaseView {

    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(RMImageAsset.close.image, for: .normal)
        button.tintColor = RMColorAsset.primaryText.color
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = CharacterUIIdentifier.filterTitle.text
        label.text = CharacterStrings.filterTitle.text
        label.textColor = RMColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.accessibilityIdentifier = CharacterUIIdentifier.filterName.text
        textField.borderStyle = .roundedRect
        textField.placeholder = CharacterStrings.filterNamePlaceholder.text
        return textField
    }()
    
    lazy var statusButton: UIButton = {
        let button = UIButton()
        button.accessibilityIdentifier = CharacterUIIdentifier.filterStatus.text
        button.setTitle(CharacterStrings.filterStatusPlaceholder.text, for: .normal)
        button.setTitleColor(RMColorAsset.primaryText.color, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = RMColorAsset.primaryText.color.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
        button.layer.cornerRadius = 6.0
        return button
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [clearButton, applyButton])
        stackView.spacing = 8.0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var clearButton: UIButton = {
        let button = UIButton()
        button.accessibilityIdentifier = CharacterUIIdentifier.filterClearButton.text
        button.setTitle(CharacterStrings.filterClearButtonText.text, for: .normal)
        button.setTitleColor(RMColorAsset.primary.color, for: .normal)
        button.backgroundColor = RMColorAsset.primaryText.color
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
        button.layer.cornerRadius = 20.0
        return button
    }()
    
    lazy var applyButton: UIButton = {
        let button = UIButton()
        button.accessibilityIdentifier = CharacterUIIdentifier.filterApplyButton.text
        button.setTitle(CharacterStrings.filterApplyButtonText.text, for: .normal)
        button.setTitleColor(RMColorAsset.primary.color, for: .normal)
        button.backgroundColor = RMColorAsset.primaryText.color
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
        button.layer.cornerRadius = 20.0
        return button
    }()

    override func setupUI() {
        addSubviews(closeButton, titleLabel, nameTextField, statusButton, buttonsStackView)
    }
    
    override func setupConstraints() {
        titleLabel
            .topAnchor(to: layoutMarginsGuide.topAnchor, constant: 30)
            .leftAnchor(to: layoutMarginsGuide.leftAnchor, constant: 16)
        
        closeButton
            .centerYAnchor(to: titleLabel.centerYAnchor)
            .leftAnchor(to: titleLabel.rightAnchor, constant: 8, type: .greaterOrEqual)
            .rightAnchor(to: layoutMarginsGuide.rightAnchor, constant: 16)
            .heightAnchor(30)
            .widthAnchor(30)
        
        nameTextField
            .topAnchor(to: titleLabel.bottomAnchor, constant: 40)
            .leftAnchor(to: layoutMarginsGuide.leftAnchor, constant: 16)
            .rightAnchor(to: layoutMarginsGuide.rightAnchor, constant: 16)
            .heightAnchor(40)
        
        statusButton
            .topAnchor(to: nameTextField.bottomAnchor, constant: 40)
            .leftAnchor(to: layoutMarginsGuide.leftAnchor, constant: 16)
            .rightAnchor(to: layoutMarginsGuide.rightAnchor, constant: 16)
            .heightAnchor(40)
        
        buttonsStackView
            .topAnchor(to: statusButton.bottomAnchor, constant: 20, type: .greaterOrEqual)
            .leftAnchor(to: layoutMarginsGuide.leftAnchor, constant: 16)
            .rightAnchor(to: layoutMarginsGuide.rightAnchor, constant: 16)
            .bottomAnchor(to: layoutMarginsGuide.bottomAnchor, constant: 30)
            .heightAnchor(40)
    }
}
