//
//  WriteReviewViewController.swift
//  Week2
//
//  Created by 김승원 on 10/19/24.
//

import UIKit

protocol WriteReviewViewControllerDelegate: AnyObject {
    func didSubmitReview(_ reviewModel: ReviewModel)
}

class WriteReviewViewController: UIViewController {
    // MARK: - Properties
    private let writeReviewView = WriteReviewView()
    
    weak var delegate: WriteReviewViewControllerDelegate?
    
    var reviewModel: ReviewModel?
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = writeReviewView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    // MARK: - Set up NavigationBar
    private func setupNavigationBar() {
        self.title = "리뷰 작성"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "제출", style: .done, target: self, action: #selector(didTapSubmitButton))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(didTapCancelButton))
    }
    
    // MARK: - Selectors
    @objc
    private func didTapSubmitButton() {
        print(#function)
        self.dismiss(animated: true, completion: nil)
        reviewModel = ReviewModel(starCount: 5, title: "임시 전달", contents: "안녕하세요오오오오오")
        if let reviewModel = self.reviewModel {
            delegate?.didSubmitReview(reviewModel)
        }
    }
    
    @objc
    private func didTapCancelButton() {
        print(#function)
        self.dismiss(animated: true, completion: nil)
    }
}
