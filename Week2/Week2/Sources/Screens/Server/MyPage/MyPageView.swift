//
//  MyPageView.swift
//  Week2
//
//  Created by 김승원 on 11/6/24.
//

import UIKit
import SnapKit

class MyPageView: UIView {
    // MARK: - UI Components
    private let titleLabel: CustomLabel = {
        let label = CustomLabel(text: "마이 페이지", color: .label, fontSize: 30, fontWeight: .bold)
        label.numberOfLines = 1
        return label
    }()
    
    private let hobbyLabel = CustomLabel(text: "내 취미", color: .label, fontSize: 16, fontWeight: .semibold)
    lazy var hobbyTextField: BasicTextField = {
        let textField = BasicTextField()
        textField.text = "내 취미입니당"
        return textField
    }()
    
    private let passwordLabel = CustomLabel(text: "내 비밀번호", color: .label, fontSize: 16, fontWeight: .semibold)
    lazy var passwordTextField: BasicTextField = {
        let textField = BasicTextField()
        textField.text = "1234"
        return textField
    }()
    
    lazy var saveButton = BasicButton("변경사항 저장하기")
    
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
        self.backgroundColor = .systemBackground
        
        self.addSubviews(titleLabel, hobbyLabel, hobbyTextField, passwordLabel, passwordTextField, saveButton)
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(5)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        hobbyLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        hobbyTextField.snp.makeConstraints {
            $0.top.equalTo(hobbyLabel.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(self.hobbyTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }

}
