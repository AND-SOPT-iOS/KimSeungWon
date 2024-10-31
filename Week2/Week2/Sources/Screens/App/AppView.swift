//
//  AppView.swift
//  Week2
//
//  Created by 김승원 on 10/13/24.
//

import UIKit
import SnapKit

class AppView: UIView {
    // MARK: - UI Components
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    lazy var topBannerCollectoinView: UICollectionView = {
        let flowLayout = SnapFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.decelerationRate = .fast
        cv.isPagingEnabled = false
        return cv
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
        self.addSubviews(scrollView)
        scrollView.addSubviews(contentView)
        contentView.addSubviews(topBannerCollectoinView)
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
            $0.height.equalTo(1500)
        }
        
        topBannerCollectoinView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(300)
        }
    }
}
