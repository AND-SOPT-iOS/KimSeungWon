//
//  MyPageViewController.swift
//  Week2
//
//  Created by 김승원 on 11/6/24.
//

import UIKit

class MyPageViewController: UIViewController {
    // MARK: - Properties
    private let myPageView = MyPageView()
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = myPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
