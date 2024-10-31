//
//  CustomLabel.swift
//  Week2
//
//  Created by 김승원 on 10/14/24.
//

import UIKit

/// UILabel를 쉽게 생성하기 위한 컴포넌트입니다.
class CustomLabel: UILabel {
    // MARK: - Properties
    let labelText: String
    let labelTextColor: UIColor
    let labelFontSize: CGFloat
    let labelFontWeight: UIFont.Weight
    let labelAlignment: NSTextAlignment
    let labelNumberOfLines: Int

    // MARK: - Init
    init(text: String, color: UIColor, fontSize: CGFloat, fontWeight: UIFont.Weight = .regular, alignment: NSTextAlignment = .left, numberOfLines: Int = 0) {
        
        self.labelText = text
        self.labelTextColor = color
        self.labelFontSize = fontSize
        self.labelFontWeight = fontWeight
        self.labelAlignment = alignment
        self.labelNumberOfLines = numberOfLines
        
        super.init(frame: .zero)
        
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up Label
    private func setupLabel() {
        self.text = labelText
        self.font = UIFont.systemFont(ofSize: labelFontSize,
                                 weight: labelFontWeight)
        self.textColor = labelTextColor
        self.textAlignment = labelAlignment
    }
}
