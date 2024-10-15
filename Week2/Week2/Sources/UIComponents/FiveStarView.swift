//
//  FiveStarView.swift
//  Week2
//
//  Created by 김승원 on 10/15/24.
//

import UIKit
import SnapKit

class FiveStarView: UIView {
    // MARK: - Properties
    private var starArray: [StarImageView] = []
    
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
    init() {
        super.init(frame: .zero)
        addArrangedSubviewsToStackView()
        setupStackViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Add arranged subviews to StackView
    private func addArrangedSubviewsToStackView() {
        self.addSubview(starStackView)
        
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
    func setupStars(_ numberOfStars: Float) { // double만큼은 필요 없기 때문에 float 사용
        let fullStars = Int(numberOfStars)
        let hasHalfStar = numberOfStars.truncatingRemainder(dividingBy: 1) > 0 // 나머지가 존재하면 반개짜리 별 그리기
        
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
