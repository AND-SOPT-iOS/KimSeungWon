//
//  ServerViewController.swift
//  Week2
//
//  Created by 김승원 on 11/2/24.
//

import UIKit

class ServerViewController: UIViewController {
    // MARK: - Properties
    private let serverView = ServerView()
    
    private let userManager = UserManager.shared

    // MARK: - Life Cycle
    override func loadView() {
        self.view = serverView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
