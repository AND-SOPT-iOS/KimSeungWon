//
//  DetailView.swift
//  Week2
//
//  Created by 김승원 on 10/15/24.
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
    private let firstEvalLabel = CustomLabel(text: "8.4만개의 평가", color: .secondaryLabel, fontSize: 12, fontWeight: .medium, alignment: .center)
    
    // 4.4
    private let secondEvalLabel = CustomLabel(text: "4.5", color: .secondaryLabel, fontSize: 20, fontWeight: .bold, alignment: .center)
    
    // 별 그림
//    private lazy var starStackView: UIStackView = {
//        let sv = UIStackView()
//        sv.axis = .horizontal
//        sv.alignment = .center
//        sv.distribution = .fillEqually
//        sv.spacing = 0
//        
//        // starImageView 5개 추가
//        for index in 0..<5 {
//            if index <= 3 {
//                let starImageView = StarImageView(.filled)
//                sv.addArrangedSubview(starImageView)
//            } else {
//                let starImageView = StarImageView(.halfFilled)
//                sv.addArrangedSubview(starImageView)
//            }
//        }
//        
//        return sv
//    }()
    
    private lazy var starStackView: FiveStarView = {
        let view = FiveStarView()
        view.setupStars(4.5)
        return view
    }()
    
    // 평가 스택뷰
    private lazy var evalStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [firstEvalLabel, secondEvalLabel, starStackView])
        sv.axis = .vertical
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fillEqually
        return sv
    }()
    
    
    
    // 세로 구분선1
    private let horizontalSeparatorView1 = SeparatorView()
    
    // 수상
    private let firstAwardLabel = CustomLabel(text: "수상", color: .secondaryLabel, fontSize: 12, fontWeight: .medium, alignment: .center)
    
    // 에디터의 선택
    private let secondAwardLabel = CustomLabel(text: "에디터의\n선택", color: .secondaryLabel, fontSize: 9, fontWeight: .regular, alignment: .center)
    
    // 앱
    private let thirdAwardLabel = CustomLabel(text: "앱", color: .secondaryLabel, fontSize: 12, fontWeight: .regular, alignment: .center)
    
    private lazy var awardStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [firstAwardLabel, secondAwardLabel, thirdAwardLabel])
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        return sv
    }()
    
    // 세로 구분선2
    private let horizontalSeparatorView2 = SeparatorView()
    
    // 연령
    private let firstAgeLabel = CustomLabel(text: "연령", color: .secondaryLabel, fontSize: 12, fontWeight: .medium, alignment: .center)
    
    // 4.4
    private let secondAgeLabel = CustomLabel(text: "4+", color: .secondaryLabel, fontSize: 20, fontWeight: .bold, alignment: .center)
    
    // 세
    private let thirdAgeLabel = CustomLabel(text: "세", color: .secondaryLabel, fontSize: 12, fontWeight: .regular, alignment: .center)
    
    // 별 스택뷰
    private lazy var ageStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [firstAgeLabel, secondAgeLabel, thirdAgeLabel])
        sv.axis = .vertical
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        return sv
    }()
    
    // 구분선 2
    private let separatorView2 = SeparatorView()
    
    // MARK: - 새로운 소식
    // 새로운 소식
    private let newsLabel = CustomLabel(text: "새로운 소식", color: .label, fontSize: 20, fontWeight: .semibold)
    
    // chevron.right 버튼
    private lazy var newsChevronButton: UIButton = {
        let btn = UIButton(type: .system)
        
        let configuration = UIImage.SymbolConfiguration(weight: .heavy)
        btn.setImage(UIImage(systemName: "chevron.right", withConfiguration: configuration), for: .normal)
        
        btn.tintColor = .secondaryLabel
        btn.imageView?.contentMode = .scaleAspectFit
        return btn
    }()
    
    // 버전 5.184.0
    private let versionLabel = CustomLabel(text: "버전 5.184.0", color: .secondaryLabel, fontSize: 13)
    
    // 2일전
    private let dateLabel = CustomLabel(text: "2일 전", color: .secondaryLabel, fontSize: 13, alignment: .right)
    
    // 설명
    private let descriptionLabel: CustomLabel = {
        let lb = CustomLabel(text: "• 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 AND SOPT 위아요를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요. 안녕하세요 저는 김승원입니다. 아 그러시구나", color: .label, fontSize: 13)
        lb.setLineSpacing(7)
        return lb
    }()
    
    // MARK: - 미리보기
    // 미리보기
    private let previewLabel = CustomLabel(text: "미리보기", color: .label, fontSize: 20, fontWeight: .semibold)
    
    // 미리보기 이미지 1
    private let previewImageView1: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "firstPreviewImage")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 15
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.systemGray5.cgColor
        iv.layer.masksToBounds = true
        return iv
    }()
    
    // 미리보기 이미지 2
    private let previewImageView2: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "secondPreviewImage")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 15
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.systemGray5.cgColor
        iv.layer.masksToBounds = true
        return iv
    }()
    
    // 아이폰 아이콘 이미지 뷰
    private let iphoneIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "iphone")
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .secondaryLabel
        return iv
    }()
    
    // 아이폰 레이블
    private let iphoneLabel = CustomLabel(text: "iPhone", color: .secondaryLabel, fontSize: 13, fontWeight: .medium)
    
    // 구분선 3
    private let separatorView3 = SeparatorView()
    
    // MARK: - 평가 및 리뷰
    
    // 추가 설명 label
    private let additionalDescriptionLabel: CustomLabel = {
        let lb = CustomLabel(text: "토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치를 해야겠지? 앤솝 35기 위아요 파이팅 야호~\n● 내 금융 현황을 한눈에, 뭐시기", color: .label, fontSize: 13)
        lb.setLineSpacing(7)
        return lb
    }()
    
    // 더보기 label (원래 버튼인데 동작은 구현하지 않기 때문에 레이블로 구현했습니다.)
    private let moreLabel = CustomLabel(text: "더 보기", color: .systemBlue, fontSize: 13, alignment: .right)
    
    // 개발자 이름 AND SOPT 35
    private let developerNameLabel = CustomLabel(text: "AND SOPT 35", color: .systemBlue, fontSize: 13)
    
    // 개발자 label
    private let developerLabel = CustomLabel(text: "개발자", color: .secondaryLabel, fontSize: 13)
    
    // 개발자 이름 스택뷰
    private lazy var developerStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [developerNameLabel, developerLabel])
        sv.axis = .vertical
        sv.spacing = 0
        sv.alignment = .leading
        sv.distribution = .fillEqually
        return sv
    }()
    
    // 개발자 chevron.right 버튼
    private lazy var developerChevronButton: UIButton = {
        let btn = UIButton(type: .system)
        
        let configuration = UIImage.SymbolConfiguration(weight: .medium)
        btn.setImage(UIImage(systemName: "chevron.right", withConfiguration: configuration), for: .normal)
        
        btn.tintColor = .secondaryLabel
        btn.imageView?.contentMode = .scaleAspectFit
        return btn
    }()
    
    // 평가 및 리뷰
    private let reviewLabel = CustomLabel(text: "평가 및 리뷰", color: .label, fontSize: 20, fontWeight: .semibold)
    
    // chevron.right 버튼
    private lazy var reviewChevronButton: UIButton = {
        let btn = UIButton(type: .system)
        
        let configuration = UIImage.SymbolConfiguration(weight: .heavy)
        btn.setImage(UIImage(systemName: "chevron.right", withConfiguration: configuration), for: .normal)
        
        btn.tintColor = .secondaryLabel
        btn.imageView?.contentMode = .scaleAspectFit
        return btn
    }()
    
    // 별점
    private let rateNumberLabel = CustomLabel(text: "4.5", color: .label, fontSize: 60, fontWeight: .black)
    

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
        contentView.addSubviews(appImageView, titleStackView, openButton, shareButton, separatorView1)
        contentView.addSubviews(evalStackView, horizontalSeparatorView1, awardStackView, horizontalSeparatorView2, ageStackView, separatorView2)
        contentView.addSubviews(newsLabel, newsChevronButton, versionLabel, dateLabel, descriptionLabel, previewLabel, previewImageView1, previewImageView2, iphoneIconImageView, iphoneLabel, separatorView3)
        contentView.addSubviews(additionalDescriptionLabel, moreLabel, developerStackView, developerChevronButton, reviewLabel, reviewChevronButton, rateNumberLabel)
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
            $0.centerX.equalToSuperview().multipliedBy(0.333)
            $0.top.equalTo(separatorView1.snp.bottom).offset(15)
            $0.height.equalTo(60)
            $0.width.equalTo(80)
        }
        
        // 세로 구분선 1
        horizontalSeparatorView1.snp.makeConstraints {
            $0.centerX.equalToSuperview().multipliedBy(0.666)
            $0.centerY.equalTo(evalStackView)
            $0.height.equalTo(32)
            $0.width.equalTo(0.3)
        }
        
        // 수상 스택뷰
        awardStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(separatorView1.snp.bottom).offset(15)
            $0.height.equalTo(60)
            $0.width.equalTo(100)
        }
        
        // 세로 구분선 2
        horizontalSeparatorView2.snp.makeConstraints {
            $0.centerX.equalToSuperview().multipliedBy(1.333)
            $0.centerY.equalTo(evalStackView)
            $0.height.equalTo(32)
            $0.width.equalTo(0.3)
        }
        
        // 연령 스택뷰
        ageStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview().multipliedBy(1.666)
            $0.top.equalTo(separatorView1.snp.bottom).offset(15)
            $0.height.equalTo(60)
            $0.width.equalTo(100)
        }
        
        // 구분선 2
        separatorView2.snp.makeConstraints {
            $0.top.equalTo(awardStackView.snp.bottom).offset(18)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(0.3)
        }
        
        // 새로운 소식
        newsLabel.snp.makeConstraints {
            $0.top.equalTo(separatorView2.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(20)
        }
        
        // 새로운 소식 chevron.right 버튼
        newsChevronButton.snp.makeConstraints {
            $0.leading.equalTo(newsLabel.snp.trailing).offset(2)
            $0.size.equalTo(18)
            $0.centerY.equalTo(newsLabel)
        }
        
        // 버전
        versionLabel.snp.makeConstraints {
            $0.top.equalTo(newsLabel.snp.bottom).offset(18)
            $0.leading.equalToSuperview().inset(20)
        }
        
        // 2일전
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(newsLabel.snp.bottom).offset(18)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        // 설명
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(versionLabel.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(20)
            
        }
        
        // 미리보기
        previewLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(35)
            $0.leading.equalToSuperview().inset(20)
        }
        
        // 미리보기 이미지 1
        previewImageView1.snp.makeConstraints {
            $0.top.equalTo(previewLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(230)
            $0.height.equalTo(475)
        }
        
        // 미리보기 이미지 2
        previewImageView2.snp.makeConstraints {
            $0.top.equalTo(previewLabel.snp.bottom).offset(15)
            $0.leading.equalTo(previewImageView1.snp.trailing).offset(10)
            $0.width.equalTo(230)
            $0.height.equalTo(475)
        }
        
        // 아이폰 아이콘 이미지뷰
        iphoneIconImageView.snp.makeConstraints {
            $0.top.equalTo(previewImageView1.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.size.equalTo(18)
        }
        
        // iphone 레이블
        iphoneLabel.snp.makeConstraints {
            $0.top.equalTo(previewImageView1.snp.bottom).offset(14)
            $0.leading.equalTo(iphoneIconImageView.snp.trailing).offset(5)
        }
        
        // 구분선 3
        separatorView3.snp.makeConstraints {
            $0.top.equalTo(iphoneIconImageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        // 추가 설명 label
        additionalDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(separatorView3.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalTo(moreLabel.snp.leading)
        }
        
        // 더보기 label
        moreLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(additionalDescriptionLabel)
            $0.width.equalTo(40)
        }
        
        // 개발자 이름 스택뷰
        developerStackView.snp.makeConstraints {
            $0.top.equalTo(additionalDescriptionLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(35)
        }
        
        // 개발자 옆 chevron.right 버튼
        developerChevronButton.snp.makeConstraints {
            $0.centerY.equalTo(developerStackView)
            $0.trailing.equalToSuperview().inset(20)
            $0.size.equalTo(18)
        }
        
        // 새로운 소식
        reviewLabel.snp.makeConstraints {
            $0.top.equalTo(developerStackView.snp.bottom).offset(48)
            $0.leading.equalToSuperview().inset(20)
        }
        
        // 새로운 소식 chevron.right 버튼
        reviewChevronButton.snp.makeConstraints {
            $0.leading.equalTo(reviewLabel.snp.trailing).offset(2)
            $0.size.equalTo(18)
            $0.centerY.equalTo(reviewLabel)
        }
        
        rateNumberLabel.snp.makeConstraints {
            $0.top.equalTo(reviewLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(20)
            
        }
    }
}
