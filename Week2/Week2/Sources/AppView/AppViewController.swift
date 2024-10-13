//
//  AppViewController.swift
//  Week2
//
//  Created by 김승원 on 10/12/24.
//

import UIKit

class AppViewController: UIViewController {
    // MARK: - Properties
    private let appView = AppView()

    // MARK: - Life Cycle
    override func loadView() {
        self.view = appView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setGesture()
    }
    
    // MARK: - Set Gesture
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapMainStackView))
        appView.mainStackView.addGestureRecognizer(tapGesture)
        appView.isUserInteractionEnabled = true
    }
    
    // MARK: - Set NavigationBar
    private func setNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "앱"
    }
    
    // MARK: - Selectors
    @objc
    private func didTapMainStackView() {
        let detailVC = DetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
