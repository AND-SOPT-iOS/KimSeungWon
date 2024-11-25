//
//  LoginResponse.swift
//  Week2
//
//  Created by 김승원 on 11/6/24.
//

import Foundation

struct LoginResponse: Codable {
    let result: LoginResult
}

struct LoginResult: Codable {
    let token: String
}
