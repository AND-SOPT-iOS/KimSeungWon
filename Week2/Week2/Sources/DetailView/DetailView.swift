//
//  DetailView.swift
//  Week2
//
//  Created by 김승원 on 10/13/24.
//

import UIKit
import SnapKit

class DetailView: UIView {
    // MARK: - 토스 메인 타이틀
    // 스크롤 뷰, 콘텐트 뷰
    let scrollView = UIScrollView()
    private var contentView = UIView()
    
    // 앱 이미지
    let appImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "appIcon")
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 20
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.systemGray5.cgColor
        return iv
    }()
    
    // 토스 레이블
    private let tossLabel = CustomLabel(text: "토스", color: .label, fontSize: 20, fontWeight: .semibold)
    
    // 토스 부제 레이블
    private let tossSubtitleLabel = CustomLabel(text: "금융이 쉬워진다", color: .secondaryLabel, fontSize: 14)
    
    // 타이틀 스택뷰
    private lazy var titleStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [tossLabel, tossSubtitleLabel])
        sv.axis = .vertical
        sv.spacing = 10
        sv.alignment = .leading
        sv.distribution = .fillProportionally
        return sv
    }()
    
    // 열기 버튼
    lazy var openButton = OpenButton(type: .system)
    
    // 내보내기 버튼
    lazy var shareButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.tintColor = .systemBlue
        return btn
    }()
    
    private let separatorView1 = SeparatorView()
    
    // MARK: - 평가, 수상, 연령
    // 8.4만개의 평가
    private let evaluationLabel = CustomLabel(text: "8.4만개의 평가", color: .secondaryLabel, fontSize: 12, fontWeight: .medium, alignment: .center)
    
    // 4.4
    private let starCountLabel = CustomLabel(text: "4.4", color: .secondaryLabel, fontSize: 20, fontWeight: .bold, alignment: .center)
    
    // 평가 스택뷰
    private lazy var evalStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [evaluationLabel, starCountLabel])
        sv.axis = .vertical
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        return sv
    }()
    
    // 수상
    private let firstAwardLabel = CustomLabel(text: "수상", color: .secondaryLabel, fontSize: 12, fontWeight: .medium, alignment: .center)
    
    // 에디터의 선택
    private let secondAwardLabel = CustomLabel(text: "에디터의\n선택", color: .secondaryLabel, fontSize: 9, fontWeight: .regular, alignment: .center)
    
    // 앱
    private let lastAwardLabel = CustomLabel(text: "앱", color: .secondaryLabel, fontSize: 12, fontWeight: .regular, alignment: .center)
    
    private lazy var awardStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [firstAwardLabel, secondAwardLabel, lastAwardLabel])
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        return sv
    }()
    
    // 연령
    private let firstAgeLabel = CustomLabel(text: "연령", color: .secondaryLabel, fontSize: 12, fontWeight: .medium, alignment: .center)
    
    // 4.4
    private let ageRangeLabel = CustomLabel(text: "4+", color: .secondaryLabel, fontSize: 20, fontWeight: .bold, alignment: .center)
    
    // 세
    private let lastAgeLabel = CustomLabel(text: "세", color: .secondaryLabel, fontSize: 12, fontWeight: .regular, alignment: .center)
    
    // 별 스택뷰
    private lazy var ageStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [firstAgeLabel, ageRangeLabel, lastAgeLabel])
        sv.axis = .vertical
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        return sv
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
    private func setupUI () {
        self.backgroundColor = .systemBackground
        
        self.addSubviews(scrollView)
        scrollView.addSubviews(contentView)
        contentView.addSubviews(appImageView, titleStackView, openButton, shareButton, separatorView1, evalStackView, awardStackView, ageStackView)
    }
    
    // MARK: - Set Top Views Alpha
    func setTopViewsAlpha(_ alpha: CGFloat) {
        appImageView.alpha = alpha
        titleStackView.alpha = alpha
        openButton.alpha = alpha
        shareButton.alpha = alpha
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        // 스크롤 뷰
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.equalTo(4000)
//            $0.height.greaterThanOrEqualTo(scrollView).priority(.low)
        }
        
        // 앱 이미지
        appImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(115)
        }
        
        // 타이틀 스택뷰
        titleStackView.snp.makeConstraints {
            $0.top.equalTo(appImageView.snp.top).offset(3)
            $0.leading.equalTo(appImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        // 열기 버튼
        openButton.snp.makeConstraints {
            $0.leading.equalTo(appImageView.snp.trailing).offset(10)
            $0.bottom.equalTo(appImageView.snp.bottom)
            $0.height.equalTo(30)
            $0.width.equalTo(70)
        }
        
        // 공유 버튼
        shareButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(appImageView.snp.bottom)
            $0.size.equalTo(30)
        }
        
        // 구분선 1
        separatorView1.snp.makeConstraints {
            $0.top.equalTo(appImageView.snp.bottom).offset(18)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(0.3)
        }
        
        // 평가 스택뷰
        evalStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(separatorView1.snp.bottom).offset(15)
            $0.height.equalTo(60)
            $0.width.equalTo(100)
        }
        
        // 수상 스택뷰
        awardStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(separatorView1.snp.bottom).offset(15)
            $0.height.equalTo(60)
            $0.width.equalTo(100)
        }
        
        // 연령 스택뷰
        ageStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(separatorView1.snp.bottom).offset(15)
            $0.height.equalTo(60)
            $0.width.equalTo(100)
        }
    }
}
