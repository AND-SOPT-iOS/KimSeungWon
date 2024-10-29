//
//  BackgroundButton.swift
//  Week2
//
//  Created by 김승원 on 10/19/24.
//

import UIKit

/// 배경이 있는 버튼 컴포넌트입니다.
class BackgroundButton: UIButton {
    // MARK: - Properties
    enum BackgroundButtonType: String {
        case review = "리뷰 작성"
        case appSupport = "앱 지원"
    }
    
    var backgroundButtonType: BackgroundButtonType

    // MARK: - Init
    init(buttonType: BackgroundButtonType) {
        self.backgroundButtonType = buttonType
        
        super.init(frame: .zero)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - set up Button
    private func setupButton() {
        var buttonConfiguration = UIButton.Configuration.plain()
        
        // 버튼 타이틀 설정
        buttonConfiguration.title = self.backgroundButtonType.rawValue
        buttonConfiguration.baseForegroundColor = .systemBlue
        buttonConfiguration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = .systemFont(ofSize: 15, weight: .semibold)
            return outgoing
        }
        
        // 버튼 이미지 설정
        let buttonImage: UIImage?
        let symbolConfiguration = UIImage.SymbolConfiguration(weight: .bold)
        
        switch self.backgroundButtonType {
        case .review:
            buttonImage = UIImage(systemName: "square.and.pencil", withConfiguration: symbolConfiguration)
        case .appSupport:
            buttonImage = UIImage(systemName: "questionmark.circle", withConfiguration: symbolConfiguration)
        }
        
        buttonConfiguration.image = buttonImage
        buttonConfiguration.imagePadding = 3 // 이미지와 타이틀 간 3pt 간격
        buttonConfiguration.imagePlacement = .leading // 이미지가 타이틀 왼쪽에 위치
        
        // 이미지 크기를 10 * 10으로 설정
        buttonConfiguration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 10)
        
        // 배경색 및 코너 모서리 설정
        self.configuration = buttonConfiguration
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
}
