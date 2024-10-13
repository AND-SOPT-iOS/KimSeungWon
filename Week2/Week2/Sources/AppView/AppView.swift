//
//  AppView.swift
//  Week2
//
//  Created by 김승원 on 10/13/24.
//

import UIKit

class AppView: UIView {
    // MARK: - UI Components
    // 앱 이미지
    private let appImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "appIcon")
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 15
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.systemGray4.cgColor
        return iv
    }()
    
    // 앱 이름
    private let appNameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "토스"
        lb.font = .systemFont(ofSize: 16, weight: .regular)
        lb.textColor = .label
        lb.textAlignment = .left
        return lb
    }()
    
    // 앱 부제
    private let appSubTitleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "금융이 쉬워진다"
        lb.font = .systemFont(ofSize: 12, weight: .regular)
        lb.textColor = .secondaryLabel
        lb.textAlignment = .left
        return lb
    }()
    
    // 이름, 부제 스택 뷰
    private lazy var titlestackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [appNameLabel, appSubTitleLabel])
        sv.axis = .vertical
        sv.alignment = .leading
        sv.distribution = .fillProportionally
        return sv
    }()
    
    // 전체 스택뷰
    lazy var mainStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [appImageView, titlestackView])
        sv.axis = .horizontal
        sv.spacing = 10
        sv.alignment = .center
        sv.distribution = .fill
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
    private func setupUI() {
        self.addSubviews(mainStackView)
        
        setupConstraints()
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        // 앱 이미지
        appImageView.snp.makeConstraints {
            $0.size.equalTo(65)
        }
        
        // 앱 이름, 부제 스택 뷰
        titlestackView.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        // 전체 스택뷰
        mainStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            $0.height.equalTo(65)
        }
    }
}
