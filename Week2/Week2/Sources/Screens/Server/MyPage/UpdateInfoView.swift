//
//  ChageInformationView.swift
//  Week2
//
//  Created by 김승원 on 11/6/24.
//

import UIKit
import SnapKit

class UpdateInfoView: UIView {
    // MARK: - UI Components
    private let titleLabel: CustomLabel = {
        let label = CustomLabel(text: "내 정보 변경", color: .label, fontSize: 30, fontWeight: .bold)
        label.numberOfLines = 1
        return label
    }()
    
    private let hobbyLabel = CustomLabel(text: "취미 변경", color: .label, fontSize: 16, fontWeight: .semibold)
    lazy var hobbyTextField = BasicTextField("새 취미를 입력하세요")
    
    private let passwordLabel = CustomLabel(text: "비밀번호 변경", color: .label, fontSize: 16, fontWeight: .semibold)
    lazy var passwordTextField = BasicTextField("새 비밀번호를 입력하세요")
    
    lazy var logOutButton: BasicButton = {
        let button = BasicButton("로그아웃")
        button.backgroundColor = .systemGray
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    lazy var saveButton = BasicButton("저장하기")

    
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
        
        self.addSubviews(titleLabel, hobbyLabel, hobbyTextField, passwordLabel, passwordTextField, logOutButton, saveButton)
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
        
        logOutButton.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-20)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(100)
            $0.height.equalTo(52)
        }
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-20)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalTo(self.logOutButton.snp.leading).offset(-7)
            $0.height.equalTo(52)
        }
    }

}
