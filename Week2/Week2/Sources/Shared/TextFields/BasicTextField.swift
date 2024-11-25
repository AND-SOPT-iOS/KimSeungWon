//
//  BasicTextField.swift
//  Week2
//
//  Created by 김승원 on 11/6/24.
//

import UIKit

class BasicTextField: UITextField {
    // MARK: - Init
    init(_ placeholder: String = "") {
        super.init(frame: .zero)
        
        setupTextField(placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupTextField
    private func setupTextField(_ placeholder: String) {
        self.placeholder = placeholder
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.secondaryLabel.cgColor
        self.layer.masksToBounds = true
        
        self.autocapitalizationType = .none // 첫 글자 자동 대문자
        self.autocorrectionType = .no // 추천 글자를 보여줄지
        self.spellCheckingType = .no // 오류난 글자를 고쳐줄지
        self.clearButtonMode = .whileEditing
        self.clearsOnBeginEditing = false
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        self.leftView = leftView
        self.leftViewMode = .always
    }
}
