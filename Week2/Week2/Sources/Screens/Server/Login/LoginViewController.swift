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
    private let userService = UserService.shared
    private let tokenManager = TokenManager.shared
    
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
        guard
            let username = loginView.usernameTextField.text, !(username.isEmpty),
            let password = loginView.passwordTextField.text, !(password.isEmpty)
                
        else {
            AlertManager.showAlert(on: self, title: "잠깐!", message: "모든 정보를 입력해 주세요", needsCancelButton: false, confirmHandler: nil)
            return
        }
        
        userService.login(username: username, password: password) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let response):
                print("LoginViewController: 로그인 성공")
                tokenManager.saveToken(response.result.token)
                self.dismiss(animated: true, completion: nil)
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
}
