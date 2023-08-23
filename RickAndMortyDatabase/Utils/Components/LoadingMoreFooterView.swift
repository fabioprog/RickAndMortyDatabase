//
//  LoadingMoreFooterView.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 14/08/23.
//

import UIKit

class LoadingMoreFooterView: UICollectionReusableView {
    
    static let identifier = String(describing: LoadingMoreFooterView.self)

    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = RMColorAsset.primaryText.color
        activityIndicator.startAnimating()
        return activityIndicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = RMColorAsset.primary.color
        addSubview(activityIndicator)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoadingMoreFooterView {
    func setupConstraint() {
        activityIndicator
            .centerXAnchor(to: centerXAnchor)
            .centerYAnchor(to: centerYAnchor)
            .widthAnchor(80)
            .heightAnchor(80)
    }
}
