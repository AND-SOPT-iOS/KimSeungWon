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
    private let userService = UserService.shared

    // MARK: - Life Cycle
    override func loadView() {
        self.view = createAccountView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupActions()
    }
    
    // MARK: - Set up Actions
    private func setupActions() {
        let alreadyHaveAccountGesture = UITapGestureRecognizer(target: self, action: #selector(didTapAlreadyHaveAccountLabel))
        createAccountView.alreadyHaveAccountLabel.addGestureRecognizer(alreadyHaveAccountGesture)
        createAccountView.alreadyHaveAccountLabel.isUserInteractionEnabled = true
        
        createAccountView.createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
    }
    
    // MARK: - Set up NavigationBar
    private func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Selectors
    @objc
    private func didTapAlreadyHaveAccountLabel() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func didTapCreateAccountButton() {
        guard
            let username = createAccountView.usernameTextField.text, !(username.isEmpty),
            let password = createAccountView.passwordTextField.text, !(password.isEmpty),
            let hobby = createAccountView.hobbyTextField.text, !(hobby.isEmpty)
                
        else {
            AlertManager.showAlert(on: self, title: "어허!", message: "모든 정보를 입력해 주세요", needsCancelButton: false, confirmHandler: nil)
            return
        }
        
        userService.register(username: username, password: password, hobby: hobby) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success:
                print("CreateAccountViewController: 회원등록 성공")
                self.navigationController?.popViewController(animated: true)
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
    
}
