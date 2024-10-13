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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
