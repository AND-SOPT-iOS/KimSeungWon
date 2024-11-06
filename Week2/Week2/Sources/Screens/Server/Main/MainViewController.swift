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
    
    var isLogin: Bool = false
    
    private let userManager = UserManager.shared

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
        
//        presentLoginView()
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
        let loginViewController = UINavigationController(rootViewController: CreateAccountViewController())
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    // MARK: - Selectors
    @objc
    private func didTapMyPageLabel() {
        let myPageViewController = MyPageViewController()
        self.navigationController?.pushViewController(myPageViewController, animated: true)
    }
}
