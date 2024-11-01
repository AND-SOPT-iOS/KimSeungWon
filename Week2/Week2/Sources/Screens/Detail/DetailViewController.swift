//
//  DetailViewController.swift
//  Week2
//
//  Created by 김승원 on 10/13/24.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    // MARK: - Properties
    private let detailView = DetailView()

    // MARK: - Life Cycle
    override func loadView() {
        self.view = detailView
    }
    
    // view will appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    // view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupCollectionView()
        setupActions()
    }
    
    // MARK: - Set up CollectionView
    private func setupCollectionView() {
        // delegate
        detailView.previewCollectionView.dataSource = self
        detailView.previewCollectionView.delegate = self
        detailView.reviewCollectionView.dataSource = self
        detailView.reviewCollectionView.delegate = self
        
        // register cells
        detailView.previewCollectionView.register(PreviewPhotoCell.self, forCellWithReuseIdentifier: PreviewPhotoCell.cellIdentifier)
        detailView.reviewCollectionView.register(ReviewCell.self, forCellWithReuseIdentifier: ReviewCell.cellIdentifier)
    }
    
    // MARK: - Set up Actions
    private func setupActions() {
        // 새로운 소식
        detailView.newsTitleView.isUserInteractionEnabled = true
        let newsTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapNewsTitleView))
        detailView.newsTitleView.addGestureRecognizer(newsTapGesture)
        
        // 평가 및 리뷰 (버전 기록)
        detailView.reviewTitleView.isUserInteractionEnabled = true
        let reviewTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapReviewButton))
        detailView.reviewTitleView.addGestureRecognizer(reviewTapGesture)
        
        // 리뷰 작성
        detailView.reviewButton.addTarget(self, action: #selector(didTapReviewButton), for: .touchUpInside)
    }
    
    // MARK: - Set up ScrollView
    private func setupScrollView() {
        detailView.scrollView.delegate = self
    }
    
    // MARK: - Set up NavigationBar
    private func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.titleView = nil
        navigationItem.rightBarButtonItem = nil
    }
    
    // MARK: - Selectors
    // 새로운 소식 > 누르면
    @objc
    private func didTapNewsTitleView() {
        let newsVC = NewsViewController()
        self.navigationController?.pushViewController(newsVC, animated: true)
    }
    
    // 평가 및 리뷰 > 누르면
    @objc
    private func didTapReviewTitleView() {
        let allReviewVC = AllReviewViewController()
        self.navigationController?.pushViewController(allReviewVC, animated: true)
    }
    
    // 리뷰 작성 누르면
    @objc
    private func didTapReviewButton() {
        let writeReviewVC = WriteReviewViewController()
        let navVC = UINavigationController(rootViewController: writeReviewVC)
        self.present(navVC, animated: true, completion: nil)
    }
}

// MARK: - UIScrollView Delegate
extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == detailView.scrollView {
            // 로고이미지가 뷰에서 사라지는 위치를 계산
            let openButtonFrame = detailView.openButton.convert(detailView.openButton.bounds, to: view)
            
            // 로고이미지가 뷰에서 스크롤되어 사라지면?
            if openButtonFrame.minY < navigationController?.navigationBar.frame.maxY ?? 0 {
                // 네비바에서 titleView, rightBarButtonitem 설정
                if navigationItem.titleView == nil {
                    let logoImageView = UIImageView(image: .toss)
                    logoImageView.contentMode = .scaleAspectFill
                    logoImageView.layer.borderWidth = 0.5
                    logoImageView.layer.borderColor = UIColor.systemGray5.cgColor
                    logoImageView.layer.cornerRadius = 8
                    logoImageView.layer.masksToBounds = true
                    
                    let logoContainerView = UIView()
                    logoContainerView.addSubview(logoImageView)
                    
                    logoImageView.snp.makeConstraints {
                        $0.edges.equalToSuperview()
                        $0.size.equalTo(30)
                    }
                    
                    let openButton = BlueOpenButton(type: .system)
                    openButton.setTitleFont(.bold)
                    
                    openButton.snp.makeConstraints {
                        $0.width.equalTo(70)
                        $0.height.equalTo(30)
                    }
                    
                    // 애니메이션으로 추가
                    UIView.transition(with: navigationController!.navigationBar, duration: 0.3, options: .transitionCrossDissolve) {
                        self.detailView.setTopViewsAlpha(0)
                        self.navigationItem.titleView = logoContainerView
                        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: openButton)
                    }
                }
                
            } else if navigationItem.titleView != nil {
                UIView.transition(with: navigationController!.navigationBar, duration: 0.3, options: .transitionCrossDissolve) {
                    self.detailView.setTopViewsAlpha(1)
                    self.navigationItem.titleView = nil
                    self.navigationItem.rightBarButtonItem = nil
                }
            }
        }
    }
}

// MARK: - CollectionView DataSource
extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == detailView.previewCollectionView {
            return PreviewModel.mockData.count
        }
        
        if collectionView == detailView.reviewCollectionView {
            return ReviewModel.mockData.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == detailView.previewCollectionView {
            guard let previewPhotoCell = detailView.previewCollectionView.dequeueReusableCell(withReuseIdentifier: PreviewPhotoCell.cellIdentifier, for: indexPath) as? PreviewPhotoCell else { return UICollectionViewCell() }
            previewPhotoCell.configure(PreviewModel.mockData[indexPath.row])
            return previewPhotoCell
        }
        
        if collectionView == detailView.reviewCollectionView {
            guard let reviewCell = detailView.reviewCollectionView.dequeueReusableCell(withReuseIdentifier: ReviewCell.cellIdentifier, for: indexPath) as? ReviewCell else { return UICollectionViewCell() }
            reviewCell.configure(ReviewModel.mockData[indexPath.row])
            return reviewCell
        }
        
        return UICollectionViewCell()
    }
}

// MARK: - CollectionView Delegate FlowLayout
extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == detailView.previewCollectionView {
            return CGSize(width: 210, height: collectionView.bounds.height)
        }
        
        if collectionView == detailView.reviewCollectionView {
            return CGSize(width: collectionView.bounds.width - 40, height: collectionView.bounds.height)
        }
        
        return CGSize(width: 0, height: 0)
    }
}
