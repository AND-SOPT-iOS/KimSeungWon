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
    
    lazy var searchPageButton = basicButton("검색 페이지")
    
    lazy var myPageButton = basicButton("마이 페이지")

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
        
        self.addSubviews(iOSImageView, searchPageButton, myPageButton)
        
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        iOSImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(70)
        }
        
        searchPageButton.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        myPageButton.snp.makeConstraints {
            $0.bottom.equalTo(searchPageButton.snp.top).offset(-10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }

}
