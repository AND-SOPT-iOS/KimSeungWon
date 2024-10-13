//
//  DetailView.swift
//  Week2
//
//  Created by 김승원 on 10/13/24.
//

import UIKit
import SnapKit

class DetailView: UIView {
    // MARK: - UI Components
    // 스크롤 뷰, 콘텐트 뷰
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    // 앱 이미지
    private let appImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "appIcon")
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 20
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.systemGray5.cgColor
        return iv
    }()
    
    // 토스 레이블
    private let tossLabel = customLabel(text: "토스", color: .label, fontSize: 24, fontWeight: .semibold)
    
    // 토스 부제 레이블
    private let tossSubtitleLabel = customLabel(text: "금융이 쉬워진다", color: .secondaryLabel, fontSize: 16)
    
    // 타이틀 스택뷰
    private lazy var titleStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [tossLabel, tossSubtitleLabel])
        sv.axis = .vertical
        sv.spacing = 10
        sv.alignment = .leading
        sv.distribution = .fillProportionally
        return sv
    }()


    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up UI
    private func setupUI () {
        self.backgroundColor = .systemBackground
        
        self.addSubviews(scrollView)
        scrollView.addSubviews(contentView)
        contentView.addSubviews(appImageView, titleStackView)
        
        setupConstraints()
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        // 스크롤 뷰
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.equalTo(4000)
//            $0.height.greaterThanOrEqualTo(scrollView).priority(.low)
        }
        
        // 앱 이미지
        appImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(120)
        }
        
        // 타이틀 스택뷰
        titleStackView.snp.makeConstraints {
            $0.top.equalTo(appImageView.snp.top).offset(3)
            $0.leading.equalTo(appImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(45)
        }
    }
}
