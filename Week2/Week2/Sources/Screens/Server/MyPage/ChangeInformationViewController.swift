//
//  ChangeInformationViewController.swift
//  Week2
//
//  Created by 김승원 on 11/6/24.
//

import UIKit

protocol ChangeInformationControllerDelegate: AnyObject {
    func didTapLogOutButton()
}

class ChangeInformationViewController: UIViewController {
    // MARK: - Properties
    private let changeInformationView = ChageInformationView()
    weak var delegate: ChangeInformationControllerDelegate?
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = changeInformationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    // MARK: - Set up Actions
    private func setupActions() {
        changeInformationView.saveButton.addTarget(self, action: #selector (didTapSaveButton), for: .touchUpInside)
        changeInformationView.logOutButton.addTarget(self, action: #selector (didTapLogOutButton), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    @objc
    private func didTapSaveButton() {
        self.navigationController?.popViewController(animated: true)
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
