//
//  Week6ViewController.swift
//  Week2
//
//  Created by 김승원 on 11/28/24.
//

import UIKit
import SwiftUI

import SnapKit

class Week6ViewController: UIViewController {
    
    // MARK: - Properties
    
    let hostingController = UIHostingController(rootView: Week6View())
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addHostingControllerOnView()
    }
    
    // MARK: - Private Func
    
    private func addHostingControllerOnView() {
        addChild(hostingController)
        self.view.addSubview(hostingController.view)
        hostingController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        hostingController.didMove(toParent: self)
    }

}
