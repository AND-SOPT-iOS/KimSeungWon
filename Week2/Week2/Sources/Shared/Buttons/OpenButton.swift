//
//  OpenButton.swift
//  Week2
//
//  Created by 김승원 on 10/14/24.
//

import UIKit

/// 파란색 배경의 열기 버튼 컴포넌트입니다.
class OpenButton: UIButton {

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up Button
    private func setupButton() {
        self.backgroundColor = .systemBlue
        self.setTitle("열기", for: .normal)
        self.setTitleColor(.white, for: .normal)
    }
}
