//
//  CharactersView.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 10/08/23.
//

import UIKit

class CharactersView: BaseView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.accessibilityIdentifier = CharacterUIIdentifier.collectionView.text
        collectionView.backgroundColor = .clear
        collectionView.register(CharactersCollectionViewCell.self,
                                forCellWithReuseIdentifier: CharactersCollectionViewCell.identifier)
        collectionView.register(LoadingMoreFooterView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: LoadingMoreFooterView.identifier)
        return collectionView
    }()
    
    override func setupUI() {
        addSubview(collectionView)
    }
    
    override func setupConstraints() {
        collectionView
            .topAnchor(to: layoutMarginsGuide.topAnchor)
            .leftAnchor(to: layoutMarginsGuide.leftAnchor)
            .rightAnchor(to: layoutMarginsGuide.rightAnchor)
            .bottomAnchor(to: bottomAnchor)
    }
}
