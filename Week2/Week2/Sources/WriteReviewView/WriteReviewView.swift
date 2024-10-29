//
//  WriteReviewView.swift
//  Week2
//
//  Created by 김승원 on 10/22/24.
//

import UIKit
import SnapKit

class WriteReviewView: UIView {
    // MARK: - UI Components
    // 앱 이미지
    private let appImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "appIcon")
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 15
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.systemGray5.cgColor
        return iv
    }()
    
    // 앱 이름
    private let appNameLabel = CustomLabel(text: "토스", color: .label, fontSize: 18)
    
    // 앱 부제
    private let appSubTitleLabel = CustomLabel(text: "금융이 쉬워진다", color: .secondaryLabel, fontSize: 12)
    
    // 이름, 부제 스택 뷰
    private lazy var titlestackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [appNameLabel, appSubTitleLabel])
        sv.axis = .vertical
        sv.alignment = .leading
        sv.distribution = .fillProportionally
        return sv
    }()
    
    // 전체 스택뷰
    lazy var mainStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [appImageView, titlestackView])
        sv.axis = .horizontal
        sv.spacing = 10
        sv.alignment = .center
        sv.distribution = .fill
        return sv
    }()
    
    // 구분선
    private let separatorView = SeparatorView()
    
    // 입력하여 평가하기
    private let writeReviewLabel = CustomLabel(text: "입력하여 평가하기:", color: .secondaryLabel, fontSize: 12)
    
    // 별점 입력 텍스트 필드
    lazy var starTextfield: UITextField = {
        let tf = UITextField()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14, weight: .regular),
            .foregroundColor: UIColor.secondaryLabel
        ]
        
        tf.attributedPlaceholder = NSAttributedString(string: "별점 입력 (최대 5점)", attributes: attributes)
        tf.backgroundColor = .secondarySystemBackground
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        tf.leftViewMode = .always
        
        tf.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        tf.rightViewMode = .always
        
        tf.font = .systemFont(ofSize: 12, weight: .regular)
        tf.textColor = .label
        
        return tf
    }()
    
    // 리뷰 입력 백뷰
    private let reviewBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    // 리뷰 제목 레이블
    private let titleLabel = CustomLabel(text: "제목", color: .label, fontSize: 16, fontWeight: .medium)
    
    // 리뷰 제목 텍스트필드
    lazy var titleTextField: UITextField = {
        let tf = UITextField()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .regular),
            .foregroundColor: UIColor.secondaryLabel
        ]
        
        tf.attributedPlaceholder = NSAttributedString(string: "선택 사항", attributes: attributes)
        return tf
    }()
    
    // 내부 구분선
    private let backViewSeparatorView = SeparatorView()
    
    // 리뷰 레이블
    private let reviewLabel = CustomLabel(text: "리뷰", color: .label, fontSize: 16, fontWeight: .medium)
    
    // 리뷰 텍스트필드
    lazy var reviewTextField: UITextField = {
        let tf = UITextField()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .regular),
            .foregroundColor: UIColor.secondaryLabel
        ]
        
        tf.attributedPlaceholder = NSAttributedString(string: "선택 사항", attributes: attributes)
        return tf
    }()
    

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
        
        self.addSubviews(mainStackView, separatorView, writeReviewLabel, starTextfield, reviewBackView)
        reviewBackView.addSubviews(titleLabel, titleTextField, backViewSeparatorView, reviewLabel, reviewTextField)
        
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        // 앱 이미지
        appImageView.snp.makeConstraints {
            $0.size.equalTo(65)
        }
        
        // 앱 이름, 부제 스택 뷰
        titlestackView.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        // 전체 스택뷰
        mainStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            $0.height.equalTo(65)
        }
        
        // 구분선
        separatorView.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        // 입력하여 평가하기
        writeReviewLabel.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(100)
        }
        
        // 별점 입력 텍스트필드
        starTextfield.snp.makeConstraints {
            $0.centerY.equalTo(writeReviewLabel)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(48)
            $0.leading.equalTo(writeReviewLabel.snp.trailing).offset(80)
        }
        
        // 리뷰 입력 백뷰
        reviewBackView.snp.makeConstraints {
            $0.top.equalTo(writeReviewLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
//            $0.height.equalTo(150)
            $0.bottom.equalTo(reviewLabel.snp.bottom).offset(16)
        }
        
        // 리뷰 제목 레이블
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(15)
            $0.width.equalTo(30)
        }
        
        // 리뷰 제목 텍스트필드
        titleTextField.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(35)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        // 내부 구분선
        backViewSeparatorView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(0.3)
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
        }
        
        // 리뷰 레이블
        reviewLabel.snp.makeConstraints {
            $0.top.equalTo(backViewSeparatorView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(15)
            $0.width.equalTo(30)
        }
        
        // 리뷰 텍스트필드
        reviewTextField.snp.makeConstraints {
            $0.centerY.equalTo(reviewLabel)
            $0.leading.equalTo(reviewLabel.snp.trailing).offset(35)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
}
