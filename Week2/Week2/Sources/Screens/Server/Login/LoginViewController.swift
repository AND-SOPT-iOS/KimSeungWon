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
        setupActions()
    }
    
    // MARK: - Set up Actions
    private func setupActions() {
        let createAccountGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCreateAccountLabel))
        loginView.createAccountLabel.addGestureRecognizer(createAccountGesture)
        loginView.createAccountLabel.isUserInteractionEnabled = true
        
        loginView.loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    // MARK: - Set up NavigationBar
    private func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Selectors
    @objc
    private func didTapCreateAccountLabel() {
        let createAccountViewController = CreateAccountViewController()
        self.navigationController?.pushViewController(createAccountViewController, animated: true)
    }
    
    @objc
    private func didTapLoginButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
