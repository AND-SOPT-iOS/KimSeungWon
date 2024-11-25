//
//  HobbyResponse.swift
//  Week2
//
//  Created by 김승원 on 11/6/24.
//

import Foundation

struct HobbyResponse: Codable {
    let result: HobbyResult
}

struct HobbyResult: Codable {
    let hobby: String
}
