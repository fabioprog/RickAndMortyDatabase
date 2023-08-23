//
//  RMDViewController.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 10/08/23.
//

import UIKit

class BaseViewController<CustomView: BaseView>: UIViewController {

    lazy var customView = CustomView()
    
    init() { super.init(nibName: nil, bundle: nil) }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        autoHideKeyboard()
    }
}
