//
//  AppButton.swift
//  Week2
//
//  Created by 김승원 on 11/1/24.
//

import UIKit
import SnapKit

class AppButton: UIButton {
    // MARK: - Properties
    enum AppButtonType: String {
        case open = "열기"
        case download = "받기"
        case update = "업데이트"
        case cloud
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set button Configure
    func setupButtonConfigure(_ appButtonType: AppButtonType) {
        var buttonConfiguration = UIButton.Configuration.plain()
        
        if appButtonType == .cloud {
            let symbolConfiguration = UIImage.SymbolConfiguration(weight: .bold)
            let buttonImage = UIImage(systemName: "icloud.and.arrow.down", withConfiguration: symbolConfiguration)
            buttonConfiguration.image = buttonImage
            buttonConfiguration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 14)
            
        } else {
            buttonConfiguration.title = appButtonType.rawValue
            buttonConfiguration.baseForegroundColor = .systemBlue
            buttonConfiguration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = .systemFont(ofSize: 16, weight: .bold)
                return outgoing
            }
            
            self.backgroundColor = .secondarySystemBackground
            self.layer.cornerRadius = 15
            self.layer.masksToBounds = true
        }
        
        self.configuration = buttonConfiguration
        
        self.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.width.equalTo(appButtonType == .update ? 80 : 70)
        }
    }
}
