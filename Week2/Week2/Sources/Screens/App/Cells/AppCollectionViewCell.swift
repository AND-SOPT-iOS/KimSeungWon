//
//  AppCollectionViewCell.swift
//  Week2
//
//  Created by 김승원 on 11/1/24.
//

import UIKit
import SnapKit

class AppCollectionViewCell: UICollectionViewCell {
    // MARK: - UI Components
    private let appImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = .temp
        iv.contentMode = .scaleAspectFill
        iv.layer.borderWidth = 0.3
        iv.layer.borderColor = UIColor.systemGray5.cgColor
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        return iv
    }()
    
    private let titleLabel: CustomLabel = {
        let lb = CustomLabel(text: "앱 타이틀\n두 줄 테스트 입니다.", color: .label, fontSize: 15, fontWeight: .regular)
        lb.numberOfLines = 2
        return lb
    }()
    
    private let subTitleLabel: CustomLabel = {
        let lb = CustomLabel(text: "서브 타이틀, 서브 타이틀, 서브 타이틀, 서브 타이틀", color: .secondaryLabel, fontSize: 11)
        lb.numberOfLines = 1
        return lb
    }()
    
    private lazy var titleStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        sv.axis = .vertical
        sv.spacing = 5
        sv.alignment = .leading
        sv.distribution = .equalSpacing
        return sv
    }()
    
    private lazy var appButton: AppButton = {
        let btn = AppButton()
        btn.setupButtonConfigure(.update)
        return btn
    }()
    
    private let separatorView = SeparatorView()
    
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
        self.addSubviews(appImageView, titleStackView, appButton, separatorView)
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        appImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.size.equalTo(60)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.height.equalTo(12)
        }
        
        titleStackView.snp.makeConstraints {
            $0.centerY.equalTo(appImageView)
            $0.leading.equalTo(appImageView.snp.trailing).offset(10)
            $0.trailing.equalTo(appButton.snp.leading).offset(-10)
        }
        
        appButton.snp.makeConstraints {
            $0.centerY.equalTo(appImageView)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.greaterThanOrEqualTo(70)
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(appImageView.snp.bottom).offset(6)
            $0.trailing.equalToSuperview()
            $0.leading.equalTo(appImageView.snp.trailing)
            $0.height.equalTo(0.3)
        }
    }
    
    // MARK: - Configure
    public func configure(with index: Int, appModel: App) {
        self.appImageView.image = appModel.appIcon
        self.titleLabel.text = appModel.title
        self.subTitleLabel.text = appModel.subTitle
        self.appButton.setupButtonConfigure(appModel.buttonState)
        
        // separatorView
        self.separatorView.isHidden = false
        if (index + 1) % 3 == 0 {
            self.separatorView.isHidden = true
        }
    }

}
