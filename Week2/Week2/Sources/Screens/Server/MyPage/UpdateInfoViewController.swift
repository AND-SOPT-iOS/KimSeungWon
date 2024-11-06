//
//  UpdateInformationViewController.swift
//  Week2
//
//  Created by 김승원 on 11/6/24.
//

import UIKit

protocol UpdateInfoViewControllerDelegate: AnyObject {
    func didTapLogOutButton()
}

class UpdateInfoViewController: UIViewController {
    // MARK: - Properties
    private let updateInfoView = UpdateInfoView()
    
    private let userService = UserService.shared
    private let tokenManager = TokenManager.shared
    
    weak var delegate: UpdateInfoViewControllerDelegate?
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = updateInfoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    // MARK: - Set up Actions
    private func setupActions() {
        updateInfoView.saveButton.addTarget(self, action: #selector (didTapSaveButton), for: .touchUpInside)
        updateInfoView.logOutButton.addTarget(self, action: #selector (didTapLogOutButton), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    @objc
    private func didTapSaveButton() {
        if updateInfoView.hobbyTextField.text?.isEmpty == true && updateInfoView.passwordTextField.text?.isEmpty == true {
            AlertManager.showAlert(on: self, title: "아니 잠깐만요", message: "하나라도 입력해 주세요", needsCancelButton: false, confirmHandler: nil)
            
        } else {
            guard let token = tokenManager.getToken(), let hobby = updateInfoView.hobbyTextField.text, let password = updateInfoView.passwordTextField.text else { return }
            userService.updateUserInfo(token: token, hobby: hobby, password: password) { [weak self] result in
                guard let self else { return }
                
                switch result {
                case .success:
                    print("UpdateInfoViewController: 정보 수정 성공")
                    self.navigationController?.popViewController(animated: true)
                case .failure(let error):
                    print(error.errorMessage)
                }
            }
        }
    }
    
    @objc
    private func didTapLogOutButton() {
        AlertManager.showAlert(on: self, title: "경고", message: "정말 로그아웃 하시겠습니까?", needsCancelButton: true) { [weak self] _ in
            guard let self else { return }
            self.navigationController?.popViewController(animated: true)
            delegate?.didTapLogOutButton()
        }
    }
}
