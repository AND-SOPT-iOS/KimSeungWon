//
//  StarImageView.swift
//  Week2
//
//  Created by 김승원 on 10/15/24.
//

import UIKit

class StarImageView: UIImageView {
    // MARK: - Properties
    enum IsFilled: String {
        case filled = "star.fill"
        case notFilled = "star"
        case halfFilled = "star.leadinghalf.filled"
    }
    
    private let isFilled: IsFilled

    // MARK: - Init
    init(_ isFilled: IsFilled) {
        self.isFilled = isFilled
        super.init(frame: .zero)
        
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - set up ImageView
    private func setupImageView() {
        self.image = UIImage(systemName: self.isFilled.rawValue)
        self.contentMode = .scaleAspectFit
        self.tintColor = .secondaryLabel
    }
    
}
