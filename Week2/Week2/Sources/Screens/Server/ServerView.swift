//
//  ServerView.swift
//  Week2
//
//  Created by 김승원 on 11/2/24.
//

import UIKit

class ServerView: UIView {
    // MARK: - UI Components

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up UI
    private func setupUI() {
        self.backgroundColor = .yellow
        
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        
    }

}
