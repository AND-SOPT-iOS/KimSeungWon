//
//  UILabel+.swift
//  Week2
//
//  Created by 김승원 on 10/15/24.
//

import UIKit

extension UILabel {
    // 행간 조절하는 함수
    func setLineSpacing(_ lineSpacing: CGFloat) {
        guard let text = text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
}
