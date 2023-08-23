//
//  CharactersCollectionViewCell.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 14/08/23.
//

import UIKit

class CharactersCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CharactersCollectionViewCell.self)
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = RMColorAsset.primaryText.color
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubviews(imageView, nameLabel)
        setupConstraints()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
    }
}

extension CharactersCollectionViewCell {
    func setupConstraints() {
        imageView
            .topAnchor(to: contentView.topAnchor)
            .leftAnchor(to: contentView.leftAnchor)
            .rightAnchor(to: contentView.rightAnchor)
        nameLabel
            .topAnchor(to: imageView.bottomAnchor, constant: 8)
            .leftAnchor(to: contentView.leftAnchor, constant: 8)
            .rightAnchor(to: contentView.rightAnchor, constant: 8)
            .bottomAnchor(to: contentView.bottomAnchor, constant: 8)
    }
    
    func setupUI() {
        contentView.backgroundColor = RMColorAsset.primary.color
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.cornerRadius = 6
        contentView.layer.shadowOffset = CGSize(width: -3, height: 3)
        contentView.layer.shadowOpacity = 0.4
    }
    
    func setupData(character: Character) {
        nameLabel.text = character.name
        nameLabel.accessibilityIdentifier = character.name
        imageView.loadFrom(urlString: character.image)
    }
}
