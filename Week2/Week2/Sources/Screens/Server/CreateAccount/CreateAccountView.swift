//
//  CreateAccountView.swift
//  Week2
//
//  Created by 김승원 on 11/6/24.
//

import UIKit
import SnapKit

class CreateAccountView: UIView {
    // MARK: - UI Components
    private let iOSImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .iOSIcon
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: CustomLabel = {
        let label = CustomLabel(text: "처음이신가요?\n계정을 만들어 주세요", color: .label, fontSize: 30, fontWeight: .bold)
        label.setLineSpacing(2)
        label.numberOfLines = 2
        return label
    }()
    
    private let subTitleLabel: CustomLabel = {
        let label = CustomLabel(text: "당신의 취미는 무엇인가요?", color: .secondaryLabel, fontSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var idTextField = BasicTextField("아이디를 입력해 주세요")
    lazy var hobbyTextField = BasicTextField("취미를 입력해 주세요")
    lazy var passwordTextField = BasicTextField("비밀번호를 입력해 주세요")
    lazy var loginButton = BasicButton("계정 만들기")
    let firstVisitLabel = LineLabel(grayText: "계정이 있으신가요?", blueText: "로그인하기", isLined: true)

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
        self.addSubviews(iOSImageView, titleLabel, subTitleLabel, idTextField, hobbyTextField, passwordTextField, loginButton, firstVisitLabel)
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
        
        hobbyTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(hobbyTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        firstVisitLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }

}
