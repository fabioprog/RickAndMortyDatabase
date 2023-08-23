//
//  UIViewControllerExtension.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 14/08/23.
//

import UIKit

extension UIViewController {

    func presentAlert(title: String?, message: String? = nil, style: UIAlertController.Style, options: [(title: String, style: UIAlertAction.Style, uiIdentifier: String)], completion: ((String) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        for option in options {
            let action = UIAlertAction.init(title: option.title, style: option.style, handler: { (action) in
                completion?(option.title)
            })
            action.accessibilityIdentifier = option.uiIdentifier
            alertController.addAction(action)
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func autoHideKeyboard() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
