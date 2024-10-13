//
//  customLabel.swift
//  Week2
//
//  Created by 김승원 on 10/14/24.
//

import UIKit

class customLabel: UILabel {
    // MARK: - Properties
    let labelText: String
    let labelTextColor: UIColor
    let labelFontSize: CGFloat
    let labelFontWeight: UIFont.Weight

    // MARK: - Init
    init(text labelText: String, color labelTextColor: UIColor, fontSize labelFontSize: CGFloat, fontWeight labelFontWeight: UIFont.Weight = .regular) {
        
        self.labelText = labelText
        self.labelTextColor = labelTextColor
        self.labelFontSize = labelFontSize
        self.labelFontWeight = labelFontWeight
        
        super.init(frame: .zero)
        
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up Label
    private func setupLabel() {
        text = labelText
        font = UIFont.systemFont(ofSize: labelFontSize,
                                 weight: labelFontWeight)
        textColor = labelTextColor
        textAlignment = .left
    }
}
