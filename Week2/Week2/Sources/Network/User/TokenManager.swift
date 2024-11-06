//
//  TokenManager.swift
//  Week2
//
//  Created by 김승원 on 11/6/24.
//

import Foundation

class TokenManager {
    static let shared = TokenManager()
    private init() {}
    private let tokenKey = "authToken"  // 저장될 키
    
    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    func getToken() -> String? {
        return UserDefaults.standard.string(forKey: tokenKey)
    }
    
    func deleteToken() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
}
