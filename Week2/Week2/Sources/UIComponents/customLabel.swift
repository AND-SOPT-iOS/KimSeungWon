//
//  CustomLabel.swift
//  Week2
//
//  Created by 김승원 on 10/14/24.
//

import UIKit

class CustomLabel: UILabel {
    // MARK: - Properties
    let labelText: String
    let labelTextColor: UIColor
    let labelFontSize: CGFloat
    let labelFontWeight: UIFont.Weight
    let labelAlignment: NSTextAlignment

    // MARK: - Init
    init(text: String, color: UIColor, fontSize: CGFloat, fontWeight: UIFont.Weight = .regular, alignment: NSTextAlignment = .left) {
        
        self.labelText = text
        self.labelTextColor = color
        self.labelFontSize = fontSize
        self.labelFontWeight = fontWeight
        self.labelAlignment = alignment
        
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
        self.numberOfLines = 0
    }
}
