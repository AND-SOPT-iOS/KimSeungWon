//
//  MainView.swift
//  Week2
//
//  Created by 김승원 on 11/2/24.
//

import UIKit
import SnapKit
import Then

class MainView: UIView {
    // MARK: - UI Components
    private let iOSImageView = UIImageView().then {
        $0.image = .iOSIcon
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var myPageButton = SimpleButton("마이 페이지")
    
    lazy var searchPageButton = SimpleButton("검색 페이지")

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
        
        self.addSubviews(iOSImageView, myPageButton, searchPageButton)
        
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        iOSImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(70)
        }
        
        myPageButton.snp.makeConstraints {
            $0.top.equalTo(iOSImageView.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        
        searchPageButton.snp.makeConstraints {
            $0.top.equalTo(myPageButton.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
    }

}
