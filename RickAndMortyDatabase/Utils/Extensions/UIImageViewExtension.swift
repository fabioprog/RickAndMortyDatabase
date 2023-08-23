//
//  UIImageViewExtension.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 13/08/23.
//

import UIKit

extension UIImageView {

    func loadFrom(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        ImageLoader().downloadImage(url) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            case .failure:
                break
            }
        }
    }
}
