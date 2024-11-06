//
//  LoginView.swift
//  Week2
//
//  Created by 김승원 on 11/5/24.
//

import UIKit
import SnapKit

class LoginView: UIView {
    // MARK: - UI Components
    private let iOSImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .iOSIcon
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: CustomLabel = {
        let label = CustomLabel(text: "안녕하세요!\n로그인이 필요합니다", color: .label, fontSize: 30, fontWeight: .bold)
        label.setLineSpacing(2)
        label.numberOfLines = 2
        return label
    }()
    
    private let subTitleLabel: CustomLabel = {
        let label = CustomLabel(text: "아이디와 비밀번호로 로그인해 주세요!", color: .secondaryLabel, fontSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var idTextField = BasicTextField("아이디를 입력해 주세요")
    lazy var passwordTextField = BasicTextField("비밀번호를 입력해 주세요")
    lazy var loginButton = BasicButton("로그인")
    let createAccountLabel = LineLabel(grayText: "처음이신가요?", blueText: "계정 만들기", isLined: true)

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
        self.addSubviews(iOSImageView, titleLabel, subTitleLabel, idTextField, passwordTextField, loginButton, createAccountLabel)
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        iOSImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(35)
            $0.leading.equalToSuperview().inset(20)
            $0.size.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(iOSImageView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(50)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        createAccountLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }

}
