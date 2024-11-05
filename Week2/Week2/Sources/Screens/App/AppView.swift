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
    
    lazy var topBannerCollectionView: UICollectionView = {
        let flowLayout = SnapFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.showsHorizontalScrollIndicator = false
        cv.decelerationRate = .fast
        cv.isPagingEnabled = false
        return cv
    }()
    
    lazy var essentialAppButtonView = SemiBoldTitleWithButtonView(title: "iPhone 필수 앱")
    private let essentialSubTitleLabel = CustomLabel(text: "에디터가 직접 고른 추천 앱으로 시작하세요", color: .secondaryLabel, fontSize: 14)
    
    lazy var essentialAppCollectionView: UICollectionView = {
        let flowLayout = SnapFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.showsHorizontalScrollIndicator = false
        cv.decelerationRate = .fast
        cv.isPagingEnabled = false
        return cv
    }()
    
    lazy var focusAppButtonView = SemiBoldTitleWithButtonView(title: "지금 주목해야 할 앱")
    private let focusSubTitleLabel = CustomLabel(text: "새로 나온 앱과 업데이트", color: .secondaryLabel, fontSize: 14)
    
    lazy var focusAppCollectionView: UICollectionView = {
        let flowLayout = SnapFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.showsHorizontalScrollIndicator = false
        cv.decelerationRate = .fast
        cv.isPagingEnabled = false
        return cv
    }()
    
    lazy var selectedAppButtonView = SemiBoldTitleWithButtonView(title: "에디터의 선택 시리즈")
    
    lazy var selectedAppCollectionView: UICollectionView = {
        let flowLayout = SnapFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.showsHorizontalScrollIndicator = false
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
        contentView.addSubviews(topBannerCollectionView, essentialAppButtonView, essentialSubTitleLabel, essentialAppCollectionView, focusAppButtonView, focusSubTitleLabel, focusAppCollectionView, selectedAppButtonView, selectedAppCollectionView)
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
            $0.bottom.equalTo(selectedAppCollectionView.snp.bottom).offset(20)
        }
        
        topBannerCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        essentialAppButtonView.snp.makeConstraints {
            $0.top.equalTo(topBannerCollectionView.snp.bottom).offset(35)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
        
        essentialSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(essentialAppButtonView.snp.bottom).offset(4)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(14)
        }
        
        essentialAppCollectionView.snp.makeConstraints {
            $0.top.equalTo(essentialSubTitleLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(216)
        }
        
        focusAppButtonView.snp.makeConstraints {
            $0.top.equalTo(essentialAppCollectionView.snp.bottom).offset(35)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
        
        focusAppButtonView.snp.makeConstraints {
            $0.top.equalTo(essentialAppCollectionView.snp.bottom).offset(35)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
        
        focusSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(focusAppButtonView.snp.bottom).offset(4)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(14)
        }
        
        focusAppCollectionView.snp.makeConstraints {
            $0.top.equalTo(focusSubTitleLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(216)
        }
        
        selectedAppButtonView.snp.makeConstraints {
            $0.top.equalTo(focusAppCollectionView.snp.bottom).offset(35)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
        
        selectedAppCollectionView.snp.makeConstraints {
            $0.top.equalTo(selectedAppButtonView.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(216)
        }
    }
}
