//
//  FiveStarView.swift
//  Week2
//
//  Created by 김승원 on 10/15/24.
//

import UIKit
import SnapKit

/// 별 5개 컴포넌트입니다.
/// setupStars()를 통해 색칠된 별의 개수를 정할 수 있습니다.
class FiveStarView: UIView {
    // MARK: - Properties
    private var starArray: [StarImageView] = []
    private var starColor: UIColor
    
    // MARK: - UI Components
    private var starStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 0
        sv.alignment = .center
        sv.distribution = .fillEqually
        return sv
    }()
    
    // MARK: - Init
    init(color: UIColor) {
        self.starColor = color
        super.init(frame: .zero)
        setupStarUI()
        setupStackViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Add arranged subviews to StackView
    private func setupStarUI() {
        self.addSubview(starStackView)
        starStackView.tintColor = starColor
        
        for _ in 0..<5 {
            let starImageView = StarImageView()
            starArray.append(starImageView)
            starStackView.addArrangedSubview(starImageView)
        }
    }
    
    // MARK: - Set up StackView Constraints
    private func setupStackViewConstraints() {
        starStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Set up Stars
    /// 별 개수를 지정하는 함수입니다.
    /// - Parameter numberOfStars: 별 개수를 Double형으로 받습니다. 소수점 이하는 반올림하여 반개짜리 별로 표시합니다.
    func setupStars(_ numberOfStars: Double) {
        let fullStars = Int(numberOfStars)
        let hasHalfStar = numberOfStars.truncatingRemainder(dividingBy: 1) > 0.4 // 나머지가 존재하면 반개짜리 별 그리기
        
        for (index, star) in starArray.enumerated() {
            if index < fullStars {
                star.changeFills(.filled)
            } else if index == fullStars && hasHalfStar {
                star.changeFills(.halfFilled)
            } else {
                star.changeFills(.notFilled)
            }
        }
    }
}
