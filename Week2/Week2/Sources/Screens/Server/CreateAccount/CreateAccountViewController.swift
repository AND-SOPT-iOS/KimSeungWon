//
//  CreateAccountViewController.swift
//  Week2
//
//  Created by 김승원 on 11/6/24.
//

import UIKit

class CreateAccountViewController: UIViewController {
    // MARK: - Properties
    private let createAccountView = CreateAccountView()

    // MARK: - Life Cycle
    override func loadView() {
        self.view = createAccountView
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
