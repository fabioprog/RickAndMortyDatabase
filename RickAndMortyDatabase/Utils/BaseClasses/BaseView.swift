//
//  RMDView.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 10/08/23.
//

import UIKit

protocol BaseViewProtocol: BaseView {
    func setupConstraints()
    func setupUI()
}

class BaseView: UIView, BaseViewProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = RMColorAsset.primary.color
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {}
    func setupUI() {}
}
