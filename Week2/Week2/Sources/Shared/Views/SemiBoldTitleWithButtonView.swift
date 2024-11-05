//
//  SemiBoldTitleWithButtonView.swift
//  Week2
//
//  Created by 김승원 on 10/18/24.
//

import UIKit
import SnapKit

/// semibold체 타이틀과 chevron버튼이 있는 컴포넌트입니다.
class SemiBoldTitleWithButtonView: UIView {
    // MARK: - Properties
    var title: String
    
    // MARK: - UI Components
    private let titleLabel = CustomLabel(text: "타이틀", color: .label, fontSize: 20, fontWeight: .semibold)
    
    private let chevronRightImageView: UIImageView = {
        let iv = UIImageView()
        let configuration = UIImage.SymbolConfiguration(weight: .heavy)
        iv.image = UIImage(systemName: "chevron.right", withConfiguration: configuration)
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .secondaryLabel
        return iv
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel, chevronRightImageView])
        sv.axis = .horizontal
        sv.alignment = .center
        sv.spacing = 2
        sv.distribution = .equalSpacing
        return sv
    }()

    // MARK: - Init
    init(title: String) {
        self.title = title
        
        super.init(frame: .zero)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up UI
    private func setupUI() {
        self.titleLabel.text = self.title
        self.addSubviews(stackView)
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.height.equalTo(20)
        }
        
        chevronRightImageView.snp.makeConstraints {
            $0.size.equalTo(18)
        }
        
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(20)
        }
    }
    
}
