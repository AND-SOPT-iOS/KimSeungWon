//
//  ReviewView.swift
//  Week2
//
//  Created by 김승원 on 10/18/24.
//

import UIKit
import SnapKit

class ReviewView: UIView {
    // MARK: - UIComponents
    private let titleLabel = CustomLabel(text: "김승원 조금만 더 긴 타이틀", color: .label, fontSize: 15, fontWeight: .semibold)
    
    // 별
    private let fiveStarView: FiveStarView = {
        let sv = FiveStarView(color: .label)
        sv.setupStars(5)
        return sv
    }()
    
    // 날짜
    private let dateLabel = CustomLabel(text: "11월 25일 • ", color: .secondaryLabel, fontSize: 13)
    
    // 작성자
    private let writerLabel = CustomLabel(text: "INFP", color: .secondaryLabel, fontSize: 13)
    
    // 본문
    private let bodyLabel = CustomLabel(text: "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리 나라만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세.", color: .secondaryLabel, fontSize: 13)

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
        self.backgroundColor = .tertiarySystemBackground
        self.layer.cornerRadius = 15
        self.setShadow(opacity: 1, Radius: 10, offSet: CGSize(width: 0, height: 0))
        
        self.addSubviews(titleLabel, fiveStarView, dateLabel, writerLabel, bodyLabel)
        
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(13)
        }
        
        fiveStarView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(14)
            $0.width.equalTo(75)
        }
        
        dateLabel.snp.makeConstraints {
            $0.centerY.equalTo(fiveStarView)
            $0.leading.equalTo(fiveStarView.snp.trailing).offset(8)
            $0.height.equalTo(14)
        }
        
        writerLabel.snp.makeConstraints {
            $0.centerY.equalTo(fiveStarView)
            $0.leading.equalTo(dateLabel.snp.trailing)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(14)
        }
        
        bodyLabel.snp.makeConstraints {
            $0.top.equalTo(fiveStarView.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.lessThanOrEqualToSuperview().inset(20)
        }
    }
}
