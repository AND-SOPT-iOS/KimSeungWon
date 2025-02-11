//
//  Banner.swift
//  Week2
//
//  Created by 김승원 on 12/9/24.
//

import SwiftUI

enum BannerState: String {
    case nowAvailable = "지금 이용 가능"
    case inProgress = "현재 진행 중"
    case newSeason = "새로운 시즌"
}

struct Banner: Identifiable {
    let id: UUID
    let bannerState: BannerState
    let title: String
    let subTitle: String
    let image: Image
}

extension Banner {
    static let mockData: [Banner] = [
        Banner(
            id: UUID(),
            bannerState: .nowAvailable,
            title: "스포티비 나우",
            subTitle: "MLB 월드 시리즈",
            image: Image(.topBanner1)
        ),
        Banner(
            id: UUID(),
            bannerState: .inProgress,
            title: "ZEPETO",
            subTitle: "마법 학교에 입학해 특별한 선물을 받으세요",
            image: Image(.topBanner2)
        ),
        Banner(
            id: UUID(),
            bannerState: .nowAvailable,
            title: "논리 퍼즐에 도전하세요",
            subTitle: "매일 즐기는 신작 게임!",
            image: Image(.topBanner3)
        ),
        Banner(
            id: UUID(),
            bannerState: .newSeason,
            title: "Wavve",
            subTitle: "전현무계획 시즌2",
            image: Image(.topBanner4)
        ),
    ]
}
