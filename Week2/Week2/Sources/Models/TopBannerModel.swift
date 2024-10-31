//
//  TopBannerModel.swift
//  Week2
//
//  Created by 김승원 on 10/31/24.
//

import UIKit

enum AppState: String {
    case nowAvailable = "지금 이용 가능"
    case inProgress = "현재 진행 중"
    case newSeason = "새로운 시즌"
}

struct TopBannerModel {
    let appState: AppState
    let title: String
    let subTitle: String
    let image: UIImage
}

extension TopBannerModel {
    static let mockData: [TopBannerModel] = [
        TopBannerModel(appState: .nowAvailable, title: "스포티비 나우", subTitle: "MLB 월드 시리즈", image: .topBanner1),
        TopBannerModel(appState: .inProgress, title: "ZEPETO", subTitle: "마법 학교에 입학해 특별한 선물을 받으세요", image: .topBanner2),
        TopBannerModel(appState: .nowAvailable, title: "논리 퍼즐에 도전하세요", subTitle: "매일 즐기는 신작 게임!", image: .topBanner3),
        TopBannerModel(appState: .newSeason, title: "Wavve", subTitle: "전현무계획 시즌2", image: .topBanner4),
    ]
}
