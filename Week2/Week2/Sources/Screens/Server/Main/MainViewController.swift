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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !isUserLoggedIn() {
            presentLoginView()
        } else {
            print("MainViewController: 로그인 상태")
        }
    }
    
    // MARK: - Set up Data
    private func setupData() {
        guard let token = tokenManager.getToken() else { return }
        userService.getMyHobby(token: token) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let response):
                print("MainViewController: 내 취미 불러오기 성공")
                print(response.result.hobby)
                self.mainView.myHobbyLabel.text = response.result.hobby + "입니다"
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
    
    // MARK: - set up Actions
    private func setupActions() {
        let myPageGesture = UITapGestureRecognizer(target: self, action: #selector(didTapMyPageLabel))
        mainView.updateInfoLabel.addGestureRecognizer(myPageGesture)
        mainView.updateInfoLabel.isUserInteractionEnabled = true
        
        mainView.searchButton.addTarget(self, action: #selector(didTapSearchButton), for: .touchUpInside)
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
        let myPageViewController = UpdateInfoViewController()
        myPageViewController.delegate = self
        self.navigationController?.pushViewController(myPageViewController, animated: true)
    }
    
    @objc
    private func didTapSearchButton() {
        guard let userNumber = mainView.searchTextField.text,
              !(userNumber.isEmpty),
              Int(userNumber) != nil,
              let token = tokenManager.getToken()
        else {
            AlertManager.showAlert(on: self, title: "잠깐!", message: "정확한 숫자를 입력해 주세요!", needsCancelButton: false, confirmHandler: nil)
            return
        }
        
        userService.getOtherHobby(token: token, userNumber: userNumber) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                print("MainViewController: 다른 사람 취미 조회 성공")
                self.mainView.resultLabel.text = response.result.hobby
            case .failure(let error):
                print(error.errorMessage)
                self.mainView.resultLabel.text = "다시 검색해 보세요"
                AlertManager.showAlert(on: self, title: "아쉽게도!", message: "검색에 실패했습니다ㅠ", needsCancelButton: false, confirmHandler: nil)
            }
        }
        print(userNumber)
    }
}

// MARK: - MyPageViewController Delegate
extension MainViewController: UpdateInfoViewControllerDelegate {
    func didTapLogOutButton() {
        tokenManager.deleteToken()
        print("MainViewController: 로그아웃")
    }
}
