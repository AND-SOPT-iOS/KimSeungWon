//
//  ReviewModel.swift
//  Week2
//
//  Created by 김승원 on 10/22/24.
//

import Foundation

struct ReviewModel {
    let starCount: Double?
    let title: String?
    let contents: String?
}

extension ReviewModel {
    static let mockData: [ReviewModel] = [
        ReviewModel(
            starCount: 5,
            title: "김승원",
            contents: "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리 나라만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세."
        ),
        ReviewModel(
            starCount: 3.5,
            title: "안녕하세요",
            contents: "위아요 짱짱"
        ),
        ReviewModel(
            starCount: 2.5,
            title: "hello",
            contents: "My name is Seung Won"
        ),
        ReviewModel(
            starCount: 4,
            title: "목데이터",
            contents: "무궁화 삼천리 화려강산 무궁화 삼천리 화려강산 무궁화 삼천리 화려강산"
        ),
        ReviewModel(
            starCount: 1.5,
            title: "과제가 어렵네요",
            contents: "아아아아ㅏ앙아ㅏ아아아아아아아앙아앙아ㅏ아앙ㅇ"
        )
    ]
}
