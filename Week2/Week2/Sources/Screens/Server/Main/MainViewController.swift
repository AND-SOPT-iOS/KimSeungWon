//
//  MainViewController.swift
//  Week2
//
//  Created by 김승원 on 11/2/24.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Properties
    private let mainView = MainView()
    
    private let userService = UserService.shared
    private let tokenManager = TokenManager.shared

    // MARK: - Life Cycle
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !isUserLoggedIn() {
            presentLoginView()
        } else {
            print("MainViewController: 로그인 상태")
        }
    }
    
    // MARK: - set up Actions
    private func setupActions() {
        let myPageGesture = UITapGestureRecognizer(target: self, action: #selector(didTapMyPageLabel))
        mainView.myPageLabel.addGestureRecognizer(myPageGesture)
        mainView.myPageLabel.isUserInteractionEnabled = true
    }
    
    // MARK: - Set up NavigationBar
    private func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - present LoginView
    private func presentLoginView() {
        let loginViewController = UINavigationController(rootViewController: LoginViewController())
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    // MARK: - is User Logged in
    private func isUserLoggedIn() -> Bool {
        if let token  = tokenManager.getToken(), !token.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Selectors
    @objc
    private func didTapMyPageLabel() {
        let myPageViewController = ChangeInformationViewController()
        myPageViewController.delegate = self
        self.navigationController?.pushViewController(myPageViewController, animated: true)
    }
}

// MARK: - MyPageViewController Delegate
extension MainViewController: ChangeInformationControllerDelegate {
    func didTapLogOutButton() {
        tokenManager.deleteToken()
        print("MainViewController: 로그아웃")
    }
}
