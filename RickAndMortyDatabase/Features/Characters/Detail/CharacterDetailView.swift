//
//  DetailCharacterView.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 10/08/23.
//

import UIKit

class CharacterDetailView: BaseView {
    
    lazy var cardContainer: UIView = {
        let view = UIView()
        view.backgroundColor = RMColorAsset.primary.color
        view.layer.cornerRadius = 10.0
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: -3, height: 3)
        view.layer.shadowOpacity = 0.4
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.accessibilityIdentifier = CharacterUIIdentifier.detailImage.text
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50.0
        return imageView
    }()
    
    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [speciesLabelTitle, speciesLabel, genderLabelTitle, genderLabel, statusLabelTitle, statusLabel, originLabelTitle, originLabel])
        stackView.spacing = 4.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var speciesLabelTitle: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = CharacterUIIdentifier.detailSpeciesTitle.text
        label.text = CharacterStrings.species.text
        label.textColor = RMColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var speciesLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = CharacterUIIdentifier.detailSpecies.text
        label.textColor = RMColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var genderLabelTitle: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = CharacterUIIdentifier.detailGenderTitle.text
        label.text = CharacterStrings.gender.text
        label.textColor = RMColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = CharacterUIIdentifier.detailGender.text
        label.textColor = RMColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var statusLabelTitle: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = CharacterUIIdentifier.detailStatusTitle.text
        label.text = CharacterStrings.status.text
        label.textColor = RMColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = CharacterUIIdentifier.detailStatus.text
        label.textColor = RMColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var originLabelTitle: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = CharacterUIIdentifier.detailOriginTitle.text
        label.text = CharacterStrings.origin.text
        label.textColor = RMColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var originLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = CharacterUIIdentifier.detailOrigin.text
        label.textColor = RMColorAsset.primaryText.color
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
        
    override func setupUI() {
        addSubviews(cardContainer)
        cardContainer.addSubviews(imageView, infoStackView)
    }
    
    override func setupConstraints() {
        cardContainer
            .topAnchor(to: layoutMarginsGuide.topAnchor, constant: 20)
            .leftAnchor(to: layoutMarginsGuide.leftAnchor, constant: 8)
            .rightAnchor(to: layoutMarginsGuide.rightAnchor, constant: 8)
            .centerXAnchor(to: layoutMarginsGuide.centerXAnchor)
        
        imageView
            .topAnchor(to: cardContainer.topAnchor, constant: 16)
            .leftAnchor(to: cardContainer.leftAnchor, constant: 16)
            .heightAnchor(100)
            .widthAnchor(100)
        
        infoStackView
            .topAnchor(to: cardContainer.topAnchor, constant: 16)
            .leftAnchor(to: imageView.rightAnchor, constant: 20)
            .rightAnchor(to: cardContainer.rightAnchor, constant: 20)
            .bottomAnchor(to: cardContainer.bottomAnchor, constant: 16)
    }
}
