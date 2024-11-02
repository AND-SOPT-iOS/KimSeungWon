//
//  ApiViewController.swift
//  Week2
//
//  Created by 김승원 on 11/2/24.
//

import UIKit

class ApiViewController: UIViewController {
    // MARK: - Properties
    private let appView = ApiView()

    // MARK: - Life Cycle
    override func loadView() {
        self.view = appView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
