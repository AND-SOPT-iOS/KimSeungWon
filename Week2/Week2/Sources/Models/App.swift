//
//  App.swift
//  Week2
//
//  Created by 김승원 on 11/1/24.
//

import UIKit

struct App {
    let appIcon: UIImage
    let title: String
    let subTitle: String
    let buttonState: AppButtonType
}

extension App {
    static let mockData: [App] = [
        App(
            appIcon: .hyundaicard,
            title: "현대카드",
            subTitle: "카드 생활을 넘어 자산 관리까지 하나의 앱으로!",
            buttonState: .download
        ),
        App(
            appIcon: .hyundaidepartment,
            title: "현대백화점",
            subTitle: "현대백화점에서 즐기는 모든 경험을 하나에 담다.",
            buttonState: .download
        ),
        App(
            appIcon: .kakaobank,
            title: "카카오뱅크",
            subTitle: "이미 모두의 은행 오 난 안 쓰는데",
            buttonState: .cloud
        ),
        App(
            appIcon: .kakaopay,
            title: "카카오페이",
            subTitle: "마음 놓고 금융하다",
            buttonState: .open
        ),
        App(
            appIcon: .kbank,
            title: "케이뱅크 (Kbank)",
            subTitle: "make money",
            buttonState: .download
        ),
        App(
            appIcon: .kbpay,
            title: "KB Pay",
            subTitle: "모든 금융을 한번에, 한손에, 한눈에 담다",
            buttonState: .update
        ),
        App(
            appIcon: .mobileTmoney,
            title: "모바일티머니",
            subTitle: "티머니의 소비생활 필수 플랫폼, '모바일 티머니'입니다.",
            buttonState: .download
        ),
        App(
            appIcon: .monimo,
            title: "monimo (모니모, 삼성금융네트웍스)",
            subTitle: "모이는 금융, 커지는 혜택! monimo 모니모",
            buttonState: .download
        ),
        App(
            appIcon: .naverpay,
            title: "네이버페이",
            subTitle: "지갑 없이 매장에서 결제",
            buttonState: .cloud
        ),
        App(
            appIcon: .pass,
            title: "PASS by KT",
            subTitle: "인증을 넘어 일상으로 PASS",
            buttonState: .open
        ),
        App(
            appIcon: .silson24,
            title: "실손24",
            subTitle: "간편한 실손보험 청구",
            buttonState: .download
        ),
        App(
            appIcon: .toss,
            title: "토스",
            subTitle: "찾았다 이녀석!!",
            buttonState: .open
        )
    ]
}
