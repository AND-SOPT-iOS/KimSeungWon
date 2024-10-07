//
//  DetailViewController.swift
//  Week1
//
//  Created by 김승원 on 10/7/24.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    // MARK: - UI Components
    private var titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "넘어온 데이터가 없습니다."
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        lb.textAlignment = .center
        lb.numberOfLines = 0
        
        lb.layer.borderColor = UIColor.lightGray.cgColor
        lb.layer.borderWidth = 1
        lb.layer.cornerRadius = 10
        lb.layer.masksToBounds = true
        return lb
    }()
    
    // 뒤로가기 버튼
    private lazy var backButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("뒤로가기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        btn.backgroundColor = .systemBlue
        
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        return btn
    }()
    
    // 텍스트필드, 버튼들 스택뷰
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel, backButton])
        sv.axis = .vertical
        sv.spacing = 10
        sv.alignment = .fill
        sv.distribution = .fillEqually
        return sv
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setButtonActions()
    }
    
    // MARK: - Set button Action
    private func setButtonActions() {
        self.backButton.addTarget(self, action: #selector (didTapBackButton), for: .touchUpInside)
    }
    
    // MARK: - Data Binding
    func dataBinding(_ data: String) {
        if !data.isEmpty {
            self.titleLabel.text = data
        }
    }
    
    // MARK: - Set up UI
    private func setupUI() {
        //배경
        self.view.backgroundColor = .white
        
        // 하위뷰 관리
        self.view.addSubviews(stackView)
        
        setupConstraints()
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
            make.height.equalTo(20 + 100)
        }
    }
    
    // MARK: - Selectors
    @objc
    private func didTapBackButton() {
        // detailVC에 NavVC가 있다면 pop(네비게이션), 없다면 dismiss(모달)
        if let navigationVC = self.navigationController {
            navigationVC.popViewController(animated: true)
            
        } else {
            self.dismiss(animated: true, completion: nil)
            
        }
    }
}
