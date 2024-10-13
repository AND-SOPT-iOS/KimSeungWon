//
//  SeparatorView.swift
//  Week2
//
//  Created by 김승원 on 10/14/24.
//

import UIKit

class SeparatorView: UIView {

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up View
    private func setupView() {
        self.backgroundColor = .systemGray4
    }
}
