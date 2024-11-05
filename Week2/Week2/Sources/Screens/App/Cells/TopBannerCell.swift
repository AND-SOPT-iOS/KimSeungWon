//
//  TopBannerCell.swift
//  Week2
//
//  Created by 김승원 on 10/31/24.
//

import UIKit
import SnapKit

class TopBannerCell: UICollectionViewCell {
    // MARK: - UI Components
    private let appStateLabel = CustomLabel(text: AppState.nowAvailable.rawValue, color: .systemBlue, fontSize: 12, fontWeight: .bold)
    private let titleLabel = CustomLabel(text: "타이틀", color: .label, fontSize: 20)
    private let subTitleLabel = CustomLabel(text: "서브 타이틀", color: .secondaryLabel, fontSize: 18)
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = .temp
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 8
        iv.layer.masksToBounds = true
        return iv
    }()
    
    
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
        self.contentView.addSubviews(appStateLabel, titleLabel, subTitleLabel, imageView)
        
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        appStateLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(15)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(appStateLabel.snp.bottom).offset(2)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

    // MARK: - Configure
    public func configure(_ topBannerModel: TopBanner) {
        self.appStateLabel.text = topBannerModel.appState.rawValue
        self.titleLabel.text = topBannerModel.title
        self.subTitleLabel.text = topBannerModel.subTitle
        self.imageView.image = topBannerModel.image
    }
}
