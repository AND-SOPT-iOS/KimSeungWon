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
    
    lazy var searchTextField = BasicTextField("검색")
    lazy var searchButton = BasicButton("검색")
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "아니 없어요 그냥"
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
    
    let myPageLabel = LineLabel(grayText: "",blueText: "내 취미가 뭐였지?" , isLined: true)

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
        
        self.addSubviews(iOSImageView, searchTextField, searchButton, resultLabel, myPageLabel)
        
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        iOSImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(70)
        }
        
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(iOSImageView.snp.bottom).offset(20)
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
        
        myPageLabel.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }

}
