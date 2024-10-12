//
//  DetailViewController.swift
//  Week1
//
//  Created by 김승원 on 10/7/24.
//

import UIKit
import SnapKit

// MARK: - Protocol
protocol DetailViewControllerDelegate: AnyObject {
    func didSelectBackButton(_ data: String)
}

class DetailViewController: UIViewController {
    // MARK: - Properties
    weak var delegate: DetailViewControllerDelegate?
    
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
    
    // textField
    private lazy var textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "이전 화면에 전달할 텍스트를 입력하세요!"
        tf.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        tf.clearButtonMode = .whileEditing
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        tf.leftView = leftView
        tf.leftViewMode = .always
        return tf
    }()
    
    // 텍스트필드, 버튼들 스택뷰
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel, backButton, textField])
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
            make.height.equalTo(20 + 150)
        }
    }
    
    // MARK: - Selectors
    @objc
    private func didTapBackButton() {
        // 대리자에게 데이터 전달
        if let text = self.textField.text {
            self.delegate?.didSelectBackButton(text)
        }
        
        // detailVC에 NavVC가 있다면 pop(네비게이션), 없다면 dismiss(모달)
        if let navigationVC = self.navigationController {
            navigationVC.popViewController(animated: true)
            
        } else {
            self.dismiss(animated: true, completion: nil)
            
        }
    }
}
