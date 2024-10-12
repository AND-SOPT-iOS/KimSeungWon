//
//  MainViewController.swift
//  Week1
//
//  Created by 김승원 on 10/7/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    // MARK: - Properties
    private var transitionToggle: Bool = false
    
    
    // MARK: - UI Components
    // 캐릭터 이미지뷰
    private let mainImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "catImage1")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    // 말풍선 이미지뷰
    private let speechBubbleImageview: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "speechBubbleImage")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    // 화면전환 상태 레이블
    private let transitionStateLabel: UILabel = {
        let lb = UILabel()
        lb.text = "네비게이션"
        lb.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        lb.textColor = .black
        lb.textAlignment = .center
        return lb
    }()
    
    // 텍스트필드
    private lazy var mainTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "전달할 텍스트를 입력하세요!"
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
    
    // 다음 화면 버튼
    private lazy var nextButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("다음 화면", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        btn.backgroundColor = .systemBlue
        
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        return btn
    }()
    
    // 전환 버튼
    private lazy var changeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("전달방식 전환", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        btn.backgroundColor = .systemBlue
        
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        return btn
    }()

    // 넘어온 데이터 보여주는 label
    private let dataLabel: UILabel = {
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
    
    // 텍스트필드, 버튼들 스택뷰
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [mainTextField, nextButton, changeButton, dataLabel])
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
    
    // MARK: - Set Button Action
    private func setButtonActions() {
        self.nextButton.addTarget(self, action: #selector (didTapNextButton), for: .touchUpInside)
        self.changeButton.addTarget(self, action: #selector(didTapChangeButton), for: .touchUpInside)
    }
    
    // MARK: - Set up UI
    private func setupUI() {
        // 배경화면
        self.view.backgroundColor = .white

        // 하위뷰 관리
        self.view.addSubviews(mainImageView, speechBubbleImageview, stackView)
        speechBubbleImageview.addSubviews(transitionStateLabel)
        
        setupConstraints()
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        let stackViewHeight = 30 + 50 + 50 + 50 + 50
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(40)
            make.centerX.equalToSuperview().offset(-10)
            make.width.equalTo(200)
            make.height.equalTo(150)
        }
        
        speechBubbleImageview.snp.makeConstraints { make in
            make.leading.equalTo(mainImageView.snp.leading).offset(180)
            make.bottom.equalTo(mainImageView.snp.bottom).offset(-100)
            make.width.height.equalTo(120)
        }
        
        transitionStateLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-11)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(stackViewHeight)
        }
    }
    
    // MARK: - Selectors
    @objc
    private func didTapNextButton() {
        let detailVC = DetailViewController()
        detailVC.delegate = self
        guard let text = mainTextField.text else { return }
        detailVC.dataBinding(text)
        
        if transitionToggle {
            self.present(detailVC, animated: true, completion: nil) // 모달 형식으로 전환
            
        } else {
            self.navigationController?.pushViewController(detailVC, animated: true) // 네비게이션 형식으로 전환
            
        }
    }
    
    @objc
    private func didTapChangeButton() {
        transitionToggle.toggle()
        transitionStateLabel.text = transitionToggle ? "모달" : "네비게이션"
        mainImageView.image = transitionToggle ? UIImage(named: "catImage2") : UIImage(named: "catImage1")
    }
}

// MARK: - DetailViewController Delegate
extension MainViewController: DetailViewControllerDelegate {
    func didSelectBackButton(_ data: String) {
        if !data.isEmpty {
            self.dataLabel.text = data
        }
    }
}
