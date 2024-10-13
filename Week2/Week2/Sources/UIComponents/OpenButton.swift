//
//  OpenButton.swift
//  Week2
//
//  Created by 김승원 on 10/14/24.
//

import UIKit

class OpenButton: UIButton {

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    // 모서리 둥글게 자르기
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up Button
    private func setupButton() {
        self.backgroundColor = .systemBlue
        self.setTitle("열기", for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        self.setTitleColor(.white, for: .normal)
    }
    
    
}
