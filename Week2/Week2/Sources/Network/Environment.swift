//
//  Environment.swift
//  Week2
//
//  Created by 김승원 on 11/2/24.
//

import Foundation

enum Environment {
    static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}
