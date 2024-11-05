//
//  SimpleButton.swift
//  Week2
//
//  Created by 김승원 on 11/5/24.
//

import UIKit

class SimpleButton: UIButton {
    // MARK: - Properties
    let buttonTitle: String

    // MARK: - Init
    init(_ buttonTitle: String) {
        self.buttonTitle = buttonTitle
        super.init(frame: .zero)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up Button
    private func setupButton() {
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.title = self.buttonTitle
        buttonConfiguration.baseForegroundColor = .white
        buttonConfiguration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = .systemFont(ofSize: 16, weight: .bold)
            return outgoing
        }
        
        self.configuration = buttonConfiguration
        self.backgroundColor = .systemBlue
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
}
