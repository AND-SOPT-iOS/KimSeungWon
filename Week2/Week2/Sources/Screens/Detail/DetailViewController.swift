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
    
    var reviewModel: ReviewModel? {
        // writeReviewVC에서 델리게이트로 받아온 review모델을 받아서 detailView로 모델을 넘겨줍니다.
        didSet {
            guard let reviewModel else { return }
            detailView.reviewModel = reviewModel
        }
    }

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
        setupActions()
    }
    
    // MARK: - Set up Actions
    private func setupActions() {
        // 새로운 소식
        detailView.newsTitleView.isUserInteractionEnabled = true
        detailView.newsTitleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapNewsTitleView)))
        
        // 평가 및 리뷰 (버전 기록)
        detailView.reviewTitleView.isUserInteractionEnabled = true
        detailView.reviewTitleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapReviewTitleView)))
        
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
        writeReviewVC.delegate = self
        let navVC = UINavigationController(rootViewController: writeReviewVC)
        self.present(navVC, animated: true, completion: nil)
    }
}

// MARK: - UIScrollView Delegate
extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 로고이미지가 뷰에서 사라지는 위치를 계산
        let openButtonFrame = detailView.openButton.convert(detailView.openButton.bounds, to: view)
        
        // 로고이미지가 뷰에서 스크롤되어 사라지면?
        if openButtonFrame.minY < navigationController?.navigationBar.frame.maxY ?? 0 {
            // 네비바에서 titleView, rightBarButtonitem 설정
            if navigationItem.titleView == nil {
                let logoImageView = UIImageView(image: UIImage(named: "appIcon"))
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
                
                let openButton = OpenButton(type: .system)
                
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

// MARK: - WriteReviewViewController Delegate
extension DetailViewController: WriteReviewViewControllerDelegate {
    // writeReviewVC에게 "제출"버튼이 눌린 시점에 reviewModel을 받아옵니다.
    func didSubmitReview(_ reviewModel: ReviewModel) {
        print("시점 전달받음")
        self.reviewModel = reviewModel
    }
}
