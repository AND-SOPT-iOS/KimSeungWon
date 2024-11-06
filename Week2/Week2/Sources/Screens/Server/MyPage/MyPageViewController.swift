//
//  MyPageViewController.swift
//  Week2
//
//  Created by 김승원 on 11/6/24.
//

import UIKit

protocol MyPageViewControllerDelegate: AnyObject {
    func didTapLogOutButton()
}

class MyPageViewController: UIViewController {
    // MARK: - Properties
    private let myPageView = MyPageView()
    weak var delegate: MyPageViewControllerDelegate?
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = myPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    // MARK: - Set up Actions
    private func setupActions() {
        myPageView.saveButton.addTarget(self, action: #selector (didTapSaveButton), for: .touchUpInside)
        myPageView.logOutButton.addTarget(self, action: #selector (didTapLogOutButton), for: .touchUpInside)
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
