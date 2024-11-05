//
//  AppTableViewCell.swift
//  Week2
//
//  Created by 김승원 on 11/1/24.
//

import UIKit
import SnapKit

class AppTableViewCell: UITableViewCell {
    // MARK: - UI Components
    private let appImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = .temp
        iv.contentMode = .scaleAspectFill
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.systemGray5.cgColor
        iv.layer.cornerRadius = 17
        iv.layer.masksToBounds = true
        return iv
    }()
    
    private let titleLabel: CustomLabel = {
        let lb = CustomLabel(text: "앱 타이틀, 앱 타이틀, ㅇ,탕,탕아후루후흐ㅜㅜㅡ루", color: .label, fontSize: 15, fontWeight: .regular)
        lb.numberOfLines = 1
        return lb
    }()
    
    private let subTitleLabel: CustomLabel = {
        let lb = CustomLabel(text: "서브 타이틀, 서브 타이틀, 서브 타이틀, 서브 타이틀", color: .secondaryLabel, fontSize: 13)
        lb.numberOfLines = 1
        return lb
    }()
    
    private lazy var titleStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        sv.axis = .vertical
        sv.spacing = 6
        sv.alignment = .leading
        sv.distribution = .fill
        return sv
    }()
    
    private lazy var appButton: AppButton = {
        let btn = AppButton()
        btn.setupButtonConfigure(.update)
        return btn
    }()
    
    private let separatorView = SeparatorView()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up UI
    private func setupUI() {
        self.contentView.addSubviews(appImageView, titleStackView, appButton, separatorView)
        self.selectionStyle = .none
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        appImageView.snp.makeConstraints {
            $0.size.equalTo(86)
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.height.equalTo(14)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.height.equalTo(14)
        }
        
        titleStackView.snp.makeConstraints {
            $0.top.equalTo(appImageView.snp.top).offset(4)
            $0.leading.equalTo(appImageView.snp.trailing).offset(14)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        appButton.snp.makeConstraints {
            $0.bottom.equalTo(appImageView.snp.bottom)
            $0.leading.equalTo(appImageView.snp.trailing).offset(14)
            $0.height.equalTo(30)
            $0.width.greaterThanOrEqualTo(70)
        }
        
        separatorView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.leading.equalTo(appImageView.snp.trailing).offset(14)
            $0.height.equalTo(0.3)
        }
    }
    
    // MARK: - Configure
    func configure(_ appModel: App) {
        self.appImageView.image = appModel.appIcon
        self.titleLabel.text = appModel.title
        self.subTitleLabel.text = appModel.subTitle
        self.appButton.setupButtonConfigure(appModel.buttonState)
    }
}
