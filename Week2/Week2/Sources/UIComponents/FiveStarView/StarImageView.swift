//
//  StarImageView.swift
//  Week2
//
//  Created by 김승원 on 10/15/24.
//

import UIKit

/// 한 개짜리 별 UIImageView 컴포넌트입니다.
class StarImageView: UIImageView {
    // MARK: - Properties
    enum IsFilled: String {
        case filled = "star.fill"
        case notFilled = "star"
        case halfFilled = "star.leadinghalf.filled"
    }
    
    private var isFilled: IsFilled = .notFilled

    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Set up ImageView
    private func setupImageView() {
        self.image = UIImage(systemName: self.isFilled.rawValue)
        self.contentMode = .scaleAspectFit
    }
    
    // MARK: - ChangeFills
    func changeFills(_ isFilled: IsFilled) {
        self.isFilled = isFilled
        self.image = UIImage(systemName: self.isFilled.rawValue)
        self.layoutIfNeeded()
    }
}
