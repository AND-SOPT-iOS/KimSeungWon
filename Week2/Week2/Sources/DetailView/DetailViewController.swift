//
//  DetailViewController.swift
//  Week2
//
//  Created by 김승원 on 10/13/24.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Properties
    private let detailView = DetailView()

    // MARK: - Life Cycle
    override func loadView() {
        self.view = detailView
    }
    
    // view will appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    // view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    // MARK: - Set up NavigationBar
    private func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
    }
    
}
