//
//  LoginViewController.swift
//  Week2
//
//  Created by 김승원 on 11/5/24.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Properties
    private let loginView = LoginView()

    // MARK: - Life Cycle
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
    }
    
    // MARK: - Set up NavigationBar
    private func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
}
