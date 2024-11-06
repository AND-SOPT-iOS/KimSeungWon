//
//  MainView.swift
//  Week2
//
//  Created by 김승원 on 11/2/24.
//

import UIKit
import SnapKit

class MainView: UIView {
    // MARK: - UI Components
    private let iOSImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .iOSIcon
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let hobbyTitleLabel: CustomLabel = {
        let label = CustomLabel(text: "나의 취미는", color: .label, fontSize: 30, fontWeight: .bold, alignment: .center)
        label.numberOfLines = 1
        return label
    }()
    
    let myHobbyLabel: CustomLabel = {
        let label = CustomLabel(text: "없습니다", color: .label, fontSize: 30, fontWeight: .bold, alignment: .center)
        label.numberOfLines = 1
        return label
    }()
    
    private let separatorView = SeparatorView()
    
    private let searchTitleLabel: CustomLabel = {
        let label = CustomLabel(text: "🔍 취미 검색하기 🔎", color: .label, fontSize: 25, fontWeight: .bold, alignment: .center)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var searchTextField = BasicTextField("유저 번호를 입력해 주세요")
    lazy var searchButton = BasicButton("검색")
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "다른 사람의 취미는?"
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 1
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemBlue.cgColor
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        return label
    }()
    
    let updateInfoLabel = LineLabel(grayText: "",blueText: "내 정보 수정하기" , isLined: true)

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
        
        self.addSubviews(iOSImageView, hobbyTitleLabel, myHobbyLabel, separatorView, searchTitleLabel, searchTextField, searchButton, resultLabel, updateInfoLabel)
        
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        iOSImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(70)
        }
        
        hobbyTitleLabel.snp.makeConstraints {
            $0.top.equalTo(iOSImageView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        myHobbyLabel.snp.makeConstraints {
            $0.top.equalTo(hobbyTitleLabel.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(myHobbyLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        searchTitleLabel.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(searchTitleLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalTo(searchButton.snp.leading).offset(-7)
            $0.height.equalTo(52)
        }
        
        searchButton.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.top)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(62)
            $0.height.equalTo(52)
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(searchButton.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        updateInfoLabel.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }

}
