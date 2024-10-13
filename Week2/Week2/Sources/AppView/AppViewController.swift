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
    
    // view will appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    // view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGesture()
    }
    
    // MARK: - Set Gesture
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapMainStackView))
        appView.mainStackView.addGestureRecognizer(tapGesture)
        appView.isUserInteractionEnabled = true
    }
    
    // MARK: - Set up NavigationBar
    private func setupNavigationBar() {
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
