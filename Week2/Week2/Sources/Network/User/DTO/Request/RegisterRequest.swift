//
//  RegisterRequest.swift
//  Week2
//
//  Created by 김승원 on 11/2/24.
//

import Foundation

struct RegisterRequest: Codable {
    let username: String
    let password: String
    let hobby: String
}
